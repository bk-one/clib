require 'open-uri'

class MarvelWrapper
  MarvelComic = Struct.new(:title, :issue, :cover_date, :cover_price, :upc, :pages,
                           :marvel_id, :front_cover, :blurb, keyword_init: true)

  def self.create_missing_comics(series)
    fetch_comics_from_series(series).each do |c|
      next unless series.comics.where(issue: c.issue).empty?

      comic_hash = c.to_h
      puts c.to_h
      front_cover_url = comic_hash.delete(:front_cover)
      marvel_id = comic_hash.delete(:marvel_id)
      comic = series.comics.create!(comic_hash)
      comic.add_external_id :marvel, marvel_id
      next if front_cover_url.blank?
      comic.front_cover.attach(io: open(front_cover_url),
                               filename: comic.cover_filename + '.' + front_cover_url.split(/\./).last)
    end
  end

  def self.fetch_comics_from_series(series)
    comics = []
    marvel_series_id = series.external_id(:marvel)
    api_response = client.series(id: marvel_series_id, limit: 1)
    available_issues = api_response[0].comics[:available]
    (available_issues / 100 + 1).times do |i|
      comics << fetch_comics(marvel_series_id, (i * 100), 100)
    end
    comics.flatten!
  end

  def self.client
    @client ||= initialize_client
  end

  def self.initialize_client
    @client = Marvel::Client.new
    @client.configure do |config|
      config.api_key = Rails.application.credentials.marvel[:api_key]
      config.private_key = Rails.application.credentials.marvel[:private_key]
    end
    @client
  end

  def self.fetch_comics(marvel_series_id, offset, limit)
    client.series_comics(marvel_series_id, offset: offset, limit: limit, orderBy: 'issueNumber').collect do |api_response|
      create_marvel_comic_struct(api_response)
    end
  end

  def self.create_marvel_comic_struct(api_response)
    MarvelComic.new(title: api_response.title, issue: api_response.issueNumber,
                    cover_date: Date.parse(api_response.dates.select { |d| d.type == 'onsaleDate' }[0].date),
                    cover_price: api_response.prices.select { |p| p.type == 'printPrice' }[0].price,
                    upc: (api_response.upc.presence ? api_response.upc.delete("-") : nil), pages: api_response.pageCount, marvel_id: api_response.id,
                    front_cover: (api_response.images[0].nil? ? nil : api_response.images[0].path + '.' + api_response.images[0].extension),
                    blurb: api_response.description)
  end
end

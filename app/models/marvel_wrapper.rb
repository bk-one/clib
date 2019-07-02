require 'open-uri'

class MarvelWrapper
  MarvelComic = Struct.new(:title, :issue, :cover_date, :cover_price, :upc, :pages,
                           :marvel_id, :front_cover, keyword_init: true)

  def self.create_missing_comics(series)
    fetch_comics_from_series(series).each do |c|
      next unless series.comics.where(issue: c.issue).empty?
      comic_hash = c.to_h
      front_cover_url = comic_hash.delete(:front_cover)
      comic = series.comics.create!(comic_hash)
      puts ">>>" + front_cover_url.to_s
      next if front_cover_url.blank?
      comic.front_cover.attach(io: open(front_cover_url),
                               filename: comic.cover_filename + '.' + front_cover_url.split(/\./).last)
    end
  end

  def self.fetch_comics_from_series(series)
    client.series(id: series.marvel_id)[0].comics.items.collect do |api_response|
      id = get_comic_id_from_stub(api_response)
      marvel_comic = fetch_comic(id)
      MarvelComic.new(title: marvel_comic.title, issue: marvel_comic.issueNumber,
                      cover_date: Date.parse(marvel_comic.dates.select { |d| d.type == 'onsaleDate' }[0].date),
                      cover_price: marvel_comic.prices.select { |p| p.type == 'printPrice' }[0].price,
                      upc: marvel_comic.upc, pages: marvel_comic.pageCount, marvel_id: id,
                      front_cover: marvel_comic.images[0].path + '.' + marvel_comic.images[0].extension)
    end
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

  def self.get_comic_id_from_stub(api_response)
    api_response.resourceURI.match(/[0-9]*$/).to_s.to_i
  end

  def self.fetch_comic(id)
    MarvelWrapper.client.comics(id: id)[0]
  end
end

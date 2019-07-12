require 'nokogiri'
require 'open-uri'

class ComicbookdbWrapper
  BASE_URL = 'http://comicbookdb.com/'.freeze
  ISSUE_URL_PREFIX = (BASE_URL + 'issue.php?ID=').freeze
  ISSUE_COVER_XPATH = '(//td[@width=120]/a)'.freeze
  ISSUE_TITLE_XPATH = '//td/span[contains(@class, "page_subheadline")'.freeze

  def self.fetch_cover(comicbookdb_id)
    doc = Nokogiri::HTML(open(issue_url(comicbookdb_id)))
    BASE_URL + doc.xpath(ISSUE_COVER_XPATH).first[:href]
  end

  def self.issue_url(issue_id)
    ISSUE_URL_PREFIX + issue_id.to_s
  end
end

class MalExploration::Scraper

  def get_page
    Nokogiri::HTML(open("https://myanimelist.net/topanime.php"))
  end

  def scrape_animes_index
    # get_page.css("div.pb12 tr.ranking-list")
    get_page.css("tr.ranking-list")
    #content > div.pb12 > table > tbody > tr:nth-child(2)
  end

  def make_animes
    scrape_animes_index.each do |r|
      MalExploration::Anime.new_from_index_page(r)
    end
  end

end

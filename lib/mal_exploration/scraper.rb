class MalExploration::Scraper

  def get_page
    Nokogiri::HTML(open("https://myanimelist.net/topanime.php"))
  end

  def scrape_animes_index
   self.get_page.css("div.pb12 tr.ranking-list")
  end

  def make_animes
    scrape_animes_index.each do |r|
      MalExploration::Anime.new_from_index_page(r)
    end
  end

end

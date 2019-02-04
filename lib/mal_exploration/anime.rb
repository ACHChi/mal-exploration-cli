class MalExploration::Anime

  attr_accessor :title, :episodes, :aired, :score, :synopsis

  def alltime
    doc = Nokogiri::HTML(open("https://myanimelist.net/topanime.php"))
    doc.css(".pb12").each do |series|
    anime = Anime.new
    anime.title = series.css("h2").text
    anime.schedule = series.css(".date").text
    anime.description = series.css("p").text
  end

  def airing
    doc = Nokogiri::HTML(open("https://myanimelist.net/topanime.php?type=airing"))
  end

  def popular
    doc = Nokogiri::HTML(open("https://myanimelist.net/topanime.php?type=bypopularity"))
  end

  def favorited
    doc = Nokogiri::HTML(open("https://myanimelist.net/topanime.php?type=favorite"))
  end

end

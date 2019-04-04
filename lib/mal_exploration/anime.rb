class MalExploration::Anime

  attr_accessor :title, :score, :info, :web

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      # r.css("a .hoverinfo_trigger fl-l fs14 fw-b").text,
      # r.css("span.text on").text,
      # r.css("div .information di-ib mt4").text
      r.css("td.title.al.va-t.word-break > div > div.di-ib.clearfix a.hoverinfo_trigger").text,
      r.css("td.score.ac.fs14 > div > span").text,
      r.css("td.title.al.va-t.word-break > div > div.information.di-ib.mt4").text,
      r.css("td.title.al.va-t.word-break > div > div.di-ib.clearfix a.hoverinfo_trigger @href").text.strip
      )
  end

  def initialize(title = nil, score = nil, info = nil, web = nil)
    @title = title
    @score = score
    @info = info
    @web = web
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def website
    element = Nokogiri::HTML(open("https://myanimelist.net/topanime.php")).css("a.hoverinfo_trigger[href]")
    @website ||= element['href']
  end


#   def alltime
#     doc = Nokogiri::HTML(open("https://myanimelist.net/topanime.php"))
#     doc.css(".pb12").each do |series|
#       anime = Anime.new
#       anime.title = series.css("a .hoverinfo_trigger fl-l fs14 fw-b").text
#       anime.info = series.css("div .information di-ib mt4").text
#       anime.score = series.css("span.text on").text
#     end
#   end
#
#   def print_alltime
#     self.alltime
#     Anime.all.each do |anime|
#       if anime.title
#         puts "Title: #{anime.title}"
#         puts "  information: #{anime.info}"
#         puts "  Score: #{anime.score}"
#       end
#     end
#   end
#
#   def airing
#     doc = Nokogiri::HTML(open("https://myanimelist.net/topanime.php?type=airing"))
#     doc.css(".pb12").each do |series|
#       anime = Anime.new
#       anime.title = series.css("a .hoverinfo_trigger fl-l fs14 fw-b").text
#       anime.info = series.css("div .information di-ib mt4").text
#       anime.score = series.css("span.text on").text
#     end
#   end
#
#   def print_airing
#     self.airing
#     Anime.all.each do |anime|
#       if anime.title
#         puts "Title: #{anime.title}"
#         puts "  information: #{anime.info}"
#         puts "  Score: #{anime.score}"
#       end
#     end
#   end
#
#   def popular
#     doc = Nokogiri::HTML(open("https://myanimelist.net/topanime.php?type=bypopularity"))
#     doc.css(".pb12").each do |series|
#       anime = Anime.new
#       anime.title = series.css("a .hoverinfo_trigger fl-l fs14 fw-b").text
#       anime.info = series.css("div .information di-ib mt4").text
#       anime.score = series.css("span.text on").text
#     end
#   end
#
#   def print_popular
#     self.popular
#     Anime.all.each do |anime|
#       if anime.title
#         puts "Title: #{anime.title}"
#         puts "  information: #{anime.info}"
#         puts "  Score: #{anime.score}"
#       end
#     end
#   end
#
#   def favorited
#     doc = Nokogiri::HTML(open("https://myanimelist.net/topanime.php?type=favorite"))
#     doc.css(".pb12").each do |series|
#       anime = Anime.new
#       anime.title = series.css("a .hoverinfo_trigger fl-l fs14 fw-b").text
#       anime.info = series.css("div .information di-ib mt4").text
#       anime.score = series.css("span.text on").text
#     end
#   end
#
#   def print_favorite
#     self.favorite
#     Anime.all.each do |anime|
#       if anime.title
#         puts "Title: #{anime.title}"
#         puts "  information: #{anime.info}"
#         puts "  Score: #{anime.score}"
#       end
#     end
#   end
#
end

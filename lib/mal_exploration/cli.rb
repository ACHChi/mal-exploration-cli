class MalExploration::CLI

  def call
    MalExploration::Scraper.new.make_animes
    puts "Welcome to My Anime List Explorer"
    topten
    goodbye
  end

  def topten
    puts ""
    puts "What number top animes would you like to see? 1-10, 11-20, 21-30, 31-40 or 41-50?"
    input = gets.strip.to_i

    print_animes(input)
    puts ""
    puts "What anime would you like more information on?"
    input = gets.strip

    anime = MalExploration::Anime.find(input.to_i)

    print_anime(anime)
  end

  def goodbye
    puts "Would you like to explore more? Enter Y or N"
    input = gets.strip.downcase
    if input == "y"
      call
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer, please try again."
      goodbye
    end
  end

  def print_animes(from_number)
    puts ""
    puts "---------- Animes #{from_number} - #{from_number+9} ----------"
    puts ""
    MalExploration::Anime.all[from_number-1, 10].each.with_index(from_number) do |anime, index|
      puts "#{index}. #{anime.title} - #{anime.score}"
    end
  end

  def print_anime(anime)
    puts "#{anime.title} "
    puts "---------------------"
    puts "#{anime.info} "
    puts "-----------------------------"
    puts "#{anime.website}"
    puts ""
  end

end

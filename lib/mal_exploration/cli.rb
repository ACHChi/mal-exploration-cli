class MalExploration::CLI

  def call
    MalExploration::Scraper.new.make_animes
    puts "Welcome to My Anime List Explorer"
    topten
  end

  def topten
    puts ""
    puts "What number top animes would you like to see? enter 1 for 1-10, 11 for 11-20, 21 for 21-30 etc"
    input = gets.strip.to_i

    print_animes(input)
    input2 = 0
    while input2 < input || input2 > input+9
      puts ""
      puts "What anime would you like more information on?"
      input2 = gets.strip.to_i
    end
    anime = MalExploration::Anime.find(input2)
    print_anime(anime)
    goodbye
  end

  def goodbye
    puts "Would you like to explore more? Enter Y or N"
    input = gets.strip.downcase
    if input == "y"
      topten
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
    puts "---------- Animes Rank #{from_number} - #{from_number+9} ----------"
    puts ""
    MalExploration::Anime.all[from_number-1, 10].each.with_index(from_number) do |anime, index|
      puts "#{index}. #{anime.title} - #{anime.score}"
    end
  end

  def print_anime(anime)
    puts ""
    puts "        #{anime.title}"
    puts "--------------------------------"
    puts "#{anime.info}"
    puts "--------------------------------"
    puts "#{anime.web}"
    puts ""
  end

end

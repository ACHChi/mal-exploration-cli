class MalExploration::CLI

  def call
    puts "Welcome to My Anime List Explorer"
    menu
    topten
    goodbye
  end

  def menu
    puts "Please use 1-4 to select a category :"
    puts "1. Top 10 anime series (all time high score)"
    puts "2. Top 10 airing anime (currently airing)"
    puts "3. Top 10 popular (views)"
    puts "4. Top 10 favorited (likes)"
  end

  def topten
    input = gets.strip.to_i
    if input == 1
      puts " 111111"
    elsif input == 2
      puts " 1222222"
    elsif input == 3
      puts " 123333"
    elsif input == 4
      puts " 123444444"
    else
      puts "That's not a valid category, please try again."
      menu
      topten
    end
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


end

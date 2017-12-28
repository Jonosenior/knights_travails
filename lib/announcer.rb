class Announcer

  def introduce
    puts "\n\nWelcome to the KNIGHT'S TRAVAILS"
    puts "\n\nI'll find the shortest path for the Knight to travel between two squares.\n\n"
    puts "This is the board:"
  end

  def elicit_square(square=1)
    if square == 1 then puts "\n\nWhich square would you like your Knight to start on?"
    else puts "\n\nAnd which square is your Knight travelling to?" end
    gets.chomp.gsub(/\D/, "").split('').map {|a| a.to_i}
  end

  def wayfinder_introduction(location, target)
    puts "\n\nSo... you want to go from #{location} to #{target}, eh?"
    puts "Let's take a look..."
  end

end

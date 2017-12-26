class Announcer

  def introduce
    puts "Welcome to the KNIGHT'S TRAVAILS"
    puts "What square would you like to start on?"
  end

  def elicit_input
    gets.chomp
  end

  def wayfinder_introduction(location, target)
    puts "\n\nSo... you want to go from #{location} to #{target}, eh?"
    puts "Let's take a look..."
  end

end

class Announcer

  def introduce
    puts "Welcome to the KNIGHT'S TRAVAILS"
    puts "I'll find the shortest path for the Knight to travel between two squares."
  end

  def ask_user_for_square(square)

  end

  def elicit_square(square=1)
    if square == 1 then puts "Which square would you like your Knight to start on?"
    else puts "And which square is your Knight travelling to?"
    end
    gets.chomp.gsub(/\D/, "").split('').map {|a| a.to_i}
  end

  def wayfinder_introduction(location, target)
    puts "\n\nSo... you want to go from #{location} to #{target}, eh?"
    puts "Let's take a look..."
  end

end
#
# @announcer = Announcer.new
# target = @announcer.elicit_square
# puts "#{target}"
# puts target[0].class

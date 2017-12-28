class Announcer

  def introduce
    puts "Welcome to the KNIGHT'S TRAVAILS"
    puts "What square would you like to start on?"
  end

  def elicit_square
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

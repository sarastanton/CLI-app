class Controller

  def self.greeting
    puts "Hello! Would you like to browse by [1] weight, [2] fiber content, or [3] name? Please enter 1, 2, or 3:"

    input = gets.chomp.to_s

    until input == "1" || input == "2" || input == "3" || input == "exit"
      puts "Sorry - I don't understand. Please enter 1, 2, 3, or exit:"
      input = gets.chomp.to_s
    end

    case input
    when "1"
      puts "you chose 1"  #testing functionality
    when "2"
      puts "you chose 2"  #testing functionality
    when "3"
      puts "you chose 3"  #testing functionality
    when "exit"
      puts "Ok, see you later!"
    end

#   #display numbered list of yarn lines - index of array?
#     while input != "exit"
#     puts "Want to know more? Enter a number from the list above. If not, enter 'exit'. "
#     input = gets.chomp
#     #display weight, fiber, price, size, yardage, sale flag if applicable
#     print "Weight: #{weight}"
#     print "Fiber content: #{content}"
#     print "Price: #{price}"
#     print "Size: #{size}"
#     print "Yardage: #{yardage}"
#     if sale
#       print "On Sale!"
#     end
#     if input == "exit"
#       puts "Ok, see you later!"
#     end
#   end
# end
end
self.greeting
end

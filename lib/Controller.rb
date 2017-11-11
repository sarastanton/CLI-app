class Controller

  def greeting
    puts "Hello! Would you like to browse by [1] weight or [2] fiber content? Please enter 1 or 2:"
    input = gets.chomp

    case input
    when "1"
      #browse by weight
    when "2"
      #browse by fiber content

  #display numbered list of yarn lines - index of array?

    while input != "exit"
    puts "Want to know more? Enter a number from the list above. If not, enter 'exit'. "
    input = gets.chomp
    #display weight, fiber, price, size, yardage, sale flag if applicable
    print "Weight: #{weight}"
    print "Fiber content: #{content}"
    print "Price: #{price}"
    print "Size: #{size}"
    print "Yardage: #{yardage}"
    if sale
      print "On Sale!"
    end
    if input == "exit"
      puts "Ok, see you later!"
    end
  end

end

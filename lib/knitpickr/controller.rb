class Controller

  def self.greeting
    puts "Hello! Would you like to browse by [1] yarn weight, [2] fiber content, or [3] yarn name? Please enter '1', '2', or '3':"

    input = gets.chomp.to_s

    until input == "1" || input == "2" || input == "3" || input == "exit"
      puts "Sorry - I don't understand. Please enter '1', '2', '3', or 'exit':"
      input = gets.chomp.to_s
    end

    case input
      when "1"
        browse_by_weight
      when "2"
        browse_by_fiber
      when "3"
        browse_by_name
      when "exit"
        puts "Ok, see you later!"
    end

  end

  def self.browse_by_weight
    puts "Here is a list of all yarn weight options:"
    Scraper.all_weights.each_with_index {|x, i| puts "#{i+1}. #{x}"}
    puts "Want to learn more? Enter a number from above. You can also enter 'list' to see the list again, or 'exit'."

    input = gets.chomp.to_i

  end

  def self.browse_by_fiber
    puts "Here is a list of all yarn fiber content options - to learn more, enter the number listed below:"
    Scraper.all_fibers.each_with_index {|x, i| puts "#{i+1}. #{x}"}
    puts "Want to learn more? Enter a number from above. You can also enter 'list' to see the list again, or 'exit'."

    input = gets.chomp

    until input.to_i != 0 || input == "exit" || input == "list"
      puts "Sorry - I don't understand. Please enter '1', '2', '3', or 'exit':"
      input = gets.chomp
    end

    if input == "exit"
        puts "Ok, see you later!"
      elsif input ==  "list"
        self.browse_by_fiber
      elsif input.to_i != 0 && Scraper.all_fibers.count
        index = input.to_i + 1
      puts Yarn.find_by_fiber(Scraper.all_fibers[index])
        # show_details(selection)
      else
        puts "Hmm, I don't see that number on the list. Let's try this again..."
        self.browse_by_fiber
    end

  end

  def self.browse_by_name
    puts "Here is a list of all yarn names - to learn more, enter the number listed below:"
    puts "Want to learn more? Enter a number from above. You can also enter 'list' to see the list again, or 'exit'."
    input = gets.chomp.to_i

  end

  def show_details(selection)
    selection.each do |yarn|
      puts "Yarn name: #{yarn.name}"
      puts "Yarn weight: #{yarn.weight}"
      puts "Fiber content: #{yarn.fiber}"
      puts "Yardage: #{yarn.yardage}"
      puts "Price: #{yarn.price}"
      if sale
        puts "On sale!"
      end
      puts "___________________________"
    end
  end

# self.greeting
end

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
        return nil
    end

  end

  def self.browse_by_weight
    puts "Here is a list of all yarn weight options - to learn more, enter the number listed below:"
      Scraper.all_weights.each_with_index {|x, i| puts "#{i+1}. #{x}"}
    puts "Want to learn more? Enter a number from above. You can also enter 'list' to see the list again, or 'exit'."

    input = gets.chomp

    until input.to_i != 0 || input == "exit" || input == "list"
      puts "Sorry - I don't understand. Please enter '1', '2', '3', or 'exit':"
      input = gets.chomp
    end

    if input == "exit"
      puts "Ok, see you later!"
      return nil
    elsif input ==  "list"
      self.browse_by_weight
    elsif input.to_i > 0 && input.to_i <= Scraper.all_weights.count

    index = input.to_i - 1

    selection = Yarn.find_by_weight(Scraper.all_weights[index])
    Yarn.show_details(selection)
      else
        puts "Hmm, I don't see that number on the list. Let's try this again..."
        self.browse_by_weight
    end

    puts "Browse again? (Y/N)"
    input = gets.chomp.downcase

    case input
    when "y"
      self.greeting
    when "n"
      puts "Ok, see you later!"
      return nil
    end

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
        return nil
      elsif input ==  "list"
        self.browse_by_fiber
      elsif input.to_i > 0 && input.to_i <= Scraper.all_fibers.count
        index = input.to_i - 1
      selection = Yarn.find_by_fiber(Scraper.all_fibers[index])
      Yarn.show_details(selection)
      else
        puts "Hmm, I don't see that number on the list. Let's try this again..."
        self.browse_by_fiber
    end

    puts "Browse again? (Y/N)"
    input = gets.chomp.downcase

    case input
    when "y"
      self.greeting
    when "n"
      puts "Ok, see you later!"
      return nil
    end

  end

  def self.browse_by_name
    puts "Here is a list of all yarn names - to learn more, enter the number listed below:"
    Scraper.all_names.each_with_index {|x, i| puts "#{i+1}. #{x}"}
    puts "Want to learn more? Enter a number from above. You can also enter 'list' to see the list again, or 'exit'."

    input = gets.chomp

    until input.to_i != 0 || input == "exit" || input == "list"
      puts "Sorry - I don't understand. Please enter '1', '2', '3', or 'exit':"
      input = gets.chomp
    end

    if input == "exit"
        puts "Ok, see you later!"
        return nil
      elsif input ==  "list"
        self.browse_by_name
      elsif input.to_i > 0 && input.to_i <= Scraper.all_names.count
        index = input.to_i - 1
      selection = Yarn.find_by_name(Scraper.all_names[index])
      Yarn.show_details(selection)
      else
        puts "Hmm, I don't see that number on the list. Let's try this again..."
        self.browse_by_name
    end

    puts "Browse again? (Y/N)"
    input = gets.chomp.downcase

    case input
    when "y"
      self.greeting
    when "n"
      puts "Ok, see you later!"
      return nil
    end

  end

end

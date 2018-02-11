class Knitpickr::Controller

  def self.greeting
    puts "Hello! Would you like to browse by [1] yarn weight, [2] fiber content, [3] yarn name, or [4] all sale items? Please enter '1', '2', '3', or '4':"

    input = gets.chomp.to_s

    until input == "1" || input == "2" || input == "3" || input == "4" || input == "exit"
      puts "Sorry - I don't understand. Please enter '1', '2', '3', '4' or 'exit':"
      input = gets.chomp.to_s
    end

    case input
      when "1"
        browse_by_weight
      when "2"
        browse_by_fiber
      when "3"
        browse_by_name
      when "4"
        browse_sale
      when "exit"
        puts "Ok, see you later!"
        return nil
    end

  end

  def self.browse_by_weight
    puts "Here is a list of all yarn weight options - to learn more, enter the number listed below:"
      Knitpickr::Scraper.all_weights.each_with_index {|x, i| puts "#{i+1}. #{x}"}
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
    elsif input.to_i > 0 && input.to_i <= Knitpickr::Scraper.all_weights.count

    index = input.to_i - 1

    selection = Knitpickr::Yarn.find_by_weight(Knitpickr::Scraper.all_weights[index])
    Knitpickr::Yarn.show_details(selection)
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
      Knitpickr::Scraper.all_fibers.each_with_index {|x, i| puts "#{i+1}. #{x}"}
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
      elsif input.to_i > 0 && input.to_i <= Knitpickr::Scraper.all_fibers.count
        index = input.to_i - 1
        selection = Knitpickr::Yarn.find_by_fiber(Knitpickr::Scraper.all_fibers[index])
        Knitpickr::Yarn.show_details(selection)
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
    Knitpickr::Scraper.all_names.each_with_index {|x, i| puts "#{i+1}. #{x}"}
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
      elsif input.to_i > 0 && input.to_i <= Knitpickr::Scraper.all_names.count
        index = input.to_i - 1
      selection = Knitpickr::Yarn.find_by_name(Knitpickr::Scraper.all_names[index])
      Knitpickr::Yarn.show_details(selection)
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

  def self.browse_sale
    puts "Here is a list of all yarn currently on sale - to learn more, enter the number listed below:"
      Knitpickr::Scraper.all_sale.each_with_index {|x, i| puts "#{i+1}. #{x.name} (#{x.price})"}
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
      self.browse_sale
    elsif input.to_i > 0 && input.to_i <= Knitpickr::Scraper.all_sale.count

    index = input.to_i - 1

    selection = Knitpickr::Scraper.all_sale[index]
    puts "Yarn name: #{selection.name}"
    puts "Yarn weight: #{selection.weight}"
    puts "Fiber content: #{selection.fiber}"
    puts "Price: #{selection.price}"
    if selection.sale
      puts "On sale!"
    end
      else
        puts "Hmm, I don't see that number on the list. Let's try this again..."
        self.browse_sale
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

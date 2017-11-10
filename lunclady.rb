require 'pry'
@total = []

@wallet = 10

class Dish
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def info
    puts "#{@name} -- #{@price}"
  end
end

@meat_loaf = Dish.new('Meatloaf', '3.50')
@hamsandwich = Dish.new('Ham Sandwich', '2.25')
@mysterymeat = Dish.new("Mystery Meat", '4.75')
### sides
@chips = Dish.new('Chips', '0.75')
@carrots = Dish.new('Carrots', '1.00')
@apple = Dish.new('Apple', '0.75')
@toast = Dish.new('Toast', '1.00')

def menu
  puts "---DIGITAL LUNCH LADY---"
  puts "1) Menu"
  puts "2) Total"
  puts "3) Clear"
  puts "\n--Type 'Quit' at any time to quit-- \n \n"
  print "WALLET = "
  print @wallet.to_f - @order_total.to_f
  print " USD \n \n"
  puts "Please make a selection: "
  selection = gets.strip.to_s
end

def choose_lunch
  def main_dish
    puts "Select ONE Main dish: "
    puts "1)"
    puts "#{@meat_loaf.info}"
    puts "2)"
    puts "#{@hamsandwich.info}"
    puts "3)"
    puts "#{@mysterymeat.info}"
    choice = gets.strip.to_s
    case choice
      when "1"
        puts "Meatloaf added!"
        @total << @meat_loaf
      when "2"
        puts "Ham Sandwich added!"
        @total << @hamsandwich
      when "3"
        puts "Mystery Meat added!"
        @total << @mysterymeat
      when "Quit", "quit", "q", "QUIT", "Q"
        total
        puts "Goodbye!"
        exit
      else
        puts "Invalid choice, try again"
        main_dish
    end
  end

  def side_one
    puts "Select a side: "
    puts "1)"
    puts "#{@chips.info}"
    puts "2)"
    puts "#{@carrots.info}"
    puts "3)"
    puts "#{@apple.info}"
    puts "4)"
    puts "#{@toast.info}"
    choice1 = gets.strip.to_s
    case choice1
      when "1"
        puts "Chips added!"
        @total << @chips
      when "2"
        puts "Carrots added!"
        @total << @carrots
      when "3"
        puts "Apple added!"
        @total << @apple
      when "4"
        puts "Toast added!"
        @total << @toast
      when "Quit", "quit", "q", "QUIT", "Q"
        total
        puts "Goodbye!"
        exit
      else
        puts "Invalid choice, try again"
        side_one
    end
  end

  def side_two
    puts "Choose one more: "
    puts "1)"
    puts "#{@chips.info}"
    puts "2)"
    puts "#{@carrots.info}"
    puts "3)"
    puts "#{@apple.info}"
    puts "4)"
    puts "#{@toast.info}"
    choice2 = gets.strip.to_s
    case choice2
      when "1"
        puts "Chips added!"
        @total << @chips
      when "2"
        puts "Carrots added!"
        @total << @carrots
      when "3"
        puts "Apple added!"
        @total << @apple
      when "4"
        puts "Toast added!"
        @total << @toast
      when "Quit", "quit", "q", "QUIT", "Q"
        total
        puts "Goodbye!"
        exit
      else
        puts "Invalid choice, try again"
        side_two
    end
  end

  def add_ons
    puts "Add Another item?"
    puts "1) YES"
    puts "2) NO"
    puts "\n--Type 'Quit' at any time to quit-- \n \n"
    puts "Choose an option: "
    opt = gets.strip.to_s
    case opt
    when "1"
      puts "Choose an item:"
      puts "1)"
      puts "#{@meat_loaf.info}"
      puts "2)"
      puts "#{@hamsandwich.info}"
      puts "3)"
      puts "#{@mysterymeat.info}"
      puts "4)"
      puts "#{@chips.info}"
      puts "5)"
      puts "#{@carrots.info}"
      puts "6)"
      puts "#{@apple.info}"
      puts "7)"
      puts "#{@toast.info}"
      opt2 = gets.strip.to_s
      case opt2
      when "1"
        puts "Meatloaf added!"
        @total << @meat_loaf
        add_ons
      when "2"
        puts "Ham Sandwich added!"
        @total << @hamsandwich
        add_ons
      when "3"
        puts "Mystery Meat added!"
        @total << @mysterymeat
        add_ons
      when "4"
        puts "Chips added!"
        @total << @chips
        add_ons
      when "5"
        puts "Carrots added!"
        @total << @carrots
        add_ons
      when "6"
        puts "Apple added!"
        @total << @apple
        add_ons
      when "7"
        puts "Toast added!"
        @total << @toast
        add_ons
      when "Quit", "quit", "q", "QUIT", "Q"
        total
        puts "Goodbye!"
        exit
      else
        puts "Invalid choice, try again"
        add_ons
      end
    when "2"
      puts "OK"
      total
    when "Quit", "quit", "q", "QUIT", "Q"
      total
      puts "Goodbye!"
      exit
    else
      puts "Invalid selection, try again"
      add_ons
    end
  end

  main_dish
  side_one
  side_two
  add_ons
end

def total
  puts "Your order is: "
  @order_total = 0
  @total.each do |item|
    puts "#{item.name} -- #{item.price}"
    @order_total += item.price.to_f
  end
  puts "Your order total is:"
  print @order_total
  print " USD\n\n"
  @remaining = @wallet.to_f - @order_total.to_f
  if @remaining >= 0
      puts "Your change is:"
      print @remaining.to_f
      print " USD.\n"
    else
      puts "Not enough cash!"
      clear
  end
end

def clear
  puts "Clear current selections?"
  puts "1) YES"
  puts "2) NO"
  puts "\n--Type 'Quit' at any time to quit-- \n \n"
  puts "Choose an option: "
  choice = gets.strip.to_s
  case choice
  when "1"
      puts "Clearing selections..."
      @total.clear
      total
    when "2"
      puts "Keeping selections..."
    when "Quit", "quit", "q", "QUIT", "Q"
      total
      puts "Goodbye!"
      exit
    else
      puts "Invalid Selection"
      clear
  end
end

loop do
  case menu
    when "1"
      choose_lunch
    when "2"
      total
    when "3"
      clear
    when "Quit", "quit", "q", "QUIT", "Q"
      total
      puts "Goodbye!"
      break
    else
      puts "Invalid selection, try again my dude"
  end
end

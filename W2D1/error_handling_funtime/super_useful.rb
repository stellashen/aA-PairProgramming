# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts "The argument passed was not an integer."
    puts "Original error message: #{e.message}"
    return -1
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    puts "You did NOT give me a fruit! Give me coffee,
      and then we can try again."
    begin
      give_coffee
      puts "Thanks for the coffee!"
      feed_me_a_fruit
    rescue
      puts "Try again."
      retry
    end
  end
end

def give_coffee
  puts "Type \"coffee\" if you want to give me coffee."
  maybe_coffee = gets.chomp
  raise "This isn't coffee!" if maybe_coffee != "coffee"
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    if name.length <= 0 || fav_pastime.length <= 0
      raise ArgumentError
    end
    raise NotRealFriendError.new("Not a real friend!") if yrs_known < 5
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end

  class NotRealFriendError < StandardError
  end
end

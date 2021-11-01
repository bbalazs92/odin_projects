class Player

  @@available_colors = ["red", "green", "blue", "yellow", "brown", "orange", "black", "white"]

  @@computer_pick = @@available_colors.sample(4)      #this will return an array of 4 random picks

  @@player_guesses = []                               #this will store the guesses of the player, each round will be 1 array. Game ending condition: if the array size reaches the number of max guesses (10)

  @@feedback = [[]]                                     #feedback will go along with the guesses

  def initialize(name)
    @name = name
  end

  def place_pegs(color1, color2, color3, color4)      #player chooses 4 colors that will be played in the player_guesses array
    guesses = [color1, color2, color3, color4]
    @@player_guesses << guesses
    evaluate
    p display_guesses
    p display_feedback
  end

  def evaluate                                        #give feedback based on the players guesses. Right color, right place = red, right color wrong place = white, else = blank. Game ending condition: all pins are red
    result = []
    @@computer_pick.each_with_index do |c_guess, c_index|
      #puts "c_guess is: #{c_guess} with index: #{c_index}"
      
      @@player_guesses.last.each_with_index do |p_guess, p_index|
        #puts "p_guess is: #{p_guess} with index: #{p_index}"
        if c_guess == p_guess and c_index == p_index
          result << "red"
        elsif c_guess == p_guess
          result << "white"
        end
      end

    end
    @@feedback << result
  end

  def game_ongoing?
    if @@player_guesses.size == 10
      puts "You ran out of options."
      return false
    elsif @@feedback.last.size == 4 and @@feedback.last.uniq.size == 1 and @@feedback.last.uniq[0] == "red"
      puts "Congrats, you won!"
      return false
    else
      return true
    end
  end

  def display_guesses
    @@player_guesses
  end

  def display_computer
    @@computer_pick
  end

  def display_feedback
    @@feedback
  end

end

def game

  puts "Welcome to Mastermind! Please enter your name:"
  new_player = Player.new(gets.chomp)
  puts "Cheater!! Computer guess:"
  p new_player.display_computer
  while new_player.game_ongoing?
    puts "Place your guesses. Available colors: red, green, blue, yellow, brown, orange, black, white."
    new_player.place_pegs(gets.chomp, gets.chomp, gets.chomp, gets.chomp)
  end
  
end

game

=begin
player1 = Player.new("Balazs")
player1.place_pegs("red", "green", "black", "white")
player1.place_pegs("red", "green", "blue", "yellow")
puts "Computer choose these colors:"
p player1.display_computer
puts "Your guesses:"
p player1.display_guesses
puts "Feedback from computer:"
p player1.display_feedback
=end
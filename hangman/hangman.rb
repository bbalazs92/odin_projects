require 'json'

class Game

  attr_accessor :word, :guess, :number_of_guesses

  def initialize(word, guess, number_of_guesses)
    @word = word
    @guess = guess
    @number_of_guesses = number_of_guesses
  end

  def to_json
    JSON.dump({
      :word => @word,
      :guess => @guess,
      :number_of_guesses => @number_of_guesses
    })
  end

  def play
    #turn words into array split at every character
    if @word.class == String
    @word = @word.downcase.split(//)
    #@guess will be a similar array to @word, it will keep track of guessed letters
    @guess = @guess.downcase.split(//) 
    end
      #for each character in @word create one "_" element in @guess if that is empty
    if @guess.empty?
      @word.each { |character| @guess << "_" }
    end

    puts "To save the game in it's current state, write save! into the console."
    p @word
    p @guess
  
    while !@word.eql?(@guess) and @number_of_guesses < 6 do

      guessed_letter = gets.chomp

      if guessed_letter.length == 1
        @word.each_with_index do |character, index|
          if guessed_letter == character
            @guess[index] = guessed_letter
          end
        end
      #this is the part where the game gets saved into a .json file
      elsif guessed_letter == "save!"
        File.open("saved_game.json", 'w') do |file|
          file.puts to_json
        end
        puts "Game progress saved!"
        break
      else
        attempt_at_resolution = guessed_letter.split(//)
        if attempt_at_resolution.eql?(@word)
          puts "you guessed right!"
          break
        else
          puts "sorry, wrong attempt."
        end
      end

      @number_of_guesses += 1

      puts "You have #{6 - @number_of_guesses} guess/es left."
      
      p @word
      p @guess
    end
  end

end

def set_up_game
  puts "Type 'new' to start a new game or 'load' to load the last saved game."
  answer = gets.chomp
  if answer == "new"
    #this array will store the strings from the txt file
    word_array = []

    #read words.txt file into word_array, .chomp command removes line break sign. 
    File.open("words.txt").readlines.each do |line|
      word_array << line.chomp
    end

    #only keep strings that are between 5 and 13 characters
    word_array.select! { |string| string.length > 4 and string.length < 13 }

    #randomly select a string
    random_word = word_array.sample

    #start a new game (not from a saved state)
    new_game = Game.new(random_word, "", 0)
    new_game.play
  elsif answer == "load"
    puts "load was the answer"
    file = File.read('saved_game.json')
    data_hash = JSON.parse(file)
    p data_hash['word']
    p data_hash['guess']
    p data_hash['number_of_guesses']
    new_game = Game.new(data_hash['word'], data_hash['guess'], data_hash['number_of_guesses'])
    new_game.play
  else
    puts "try again"
  end

end

set_up_game
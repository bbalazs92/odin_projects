#read the word list file to the app and store the words in an array
#filter out words that are longer than 12 but less than 5 characters long
#select one word randomly that is between 5 to 12 characters long


word_array = []
number_of_guesses = 0

File.open("words.txt").readlines.each do |line|
  word_array << line.chomp
end

word_array.select! { |string| string.length > 4 and string.length < 13 }

random_word = word_array.sample.downcase.split(//)

guesses_array = []
random_word.each { |character| guesses_array << "_" }
p random_word
p guesses_array

while !random_word.eql?(guesses_array) and number_of_guesses < 6 do

  guessed_letter = gets.chomp

  if guessed_letter.length == 1
    random_word.each_with_index do |character, index|
      if guessed_letter == character
        guesses_array[index] = guessed_letter
      end
    end
  else
    attempt_at_resolution = guessed_letter.split(//)
    if attempt_at_resolution.eql?(random_word)
      puts "you guessed right!"
      break
    else
      puts "sorry, wrong attempt."
    end
  end

  number_of_guesses += 1

  puts "You have #{6 - number_of_guesses} guesses left."
  
  p random_word
  p guesses_array
end

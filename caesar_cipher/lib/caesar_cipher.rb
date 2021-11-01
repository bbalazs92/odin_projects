#ASCII code range for lowercase letters in alphabetical order: 97-122

#define a method to convert a string input into an array of ASCII codes | WORKS
#.bytes will convert the characters in a string into their respective ASCII code
def convert_to_ascii(string)
  ascii_array = string.bytes 
end

#define a method to check for valid input | A-Z a-z .,!? and space
def valid_input?(array_of_ascii)
  check_array = []
  array_of_ascii.each do |value|
    if value == 32 or value == 33 or value == 44 or value == 46 or value == 63
      check_array.push(1)
    elsif value > 64 and value < 91
      check_array.push(1)
    elsif value > 96 and value < 123
      check_array.push(1)
    else
      check_array.push(0)
    end
  end
  if check_array.include?(0)
    return false
  else 
    return true
  end
end

#define a method that converts an array of ASCII codes into a string
#Integer.chr will return the character from an ASCII code
def convert_to_string(array)
  string = array.map { |integer| integer.chr }.join
end

#define a method that shifts the ASCII codes by a given value with respect to alphabet
#currently works with lowercase letters
#should check for spaces

def shift_position(array, integer)
  modified_array = []
  array.each do |value|
    #check for special characters, if it is one, shove it in the array, no shift needed
    if value == 32 or value == 33 or value == 44 or value == 46 or value == 63 
    modified_array.push(value) 
    #now lets descends to the depths of a lengthy if statement
    #check whether is uppercase or lowercase based on ASCII table range
    #then shift it accordingly and shove it into the modified array

    #this checks for uppercase
    elsif value > 64 and value < 91
      value += integer
        if value < 65
          value += 26
          modified_array.push(value)
        elsif value > 90
          value -= 26
          modified_array.push(value)
        else 
          modified_array.push(value)
        end

    #this checks for lowercase
    elsif value > 96 and value < 123
      value += integer
        if value < 97
          value += 26
          modified_array.push(value)
        elsif value > 122
          value -= 26
          modified_array.push(value)
        else 
          modified_array.push(value)
        end
    end
  end
  modified_array
end

#create the main method where the final output is generated
def caesar_cipher(sentence, number)
  #has to contain valid characters and number has to be between -26 and 26 because
  #it would shift back to normal
  if valid_input?(convert_to_ascii(sentence)) and number < 26 and number > -26
    return convert_to_string(shift_position(convert_to_ascii(sentence), number))
  else
    return "Invalid input"
  end
end


#puts "A single character: d shifted by -2"
#p caesar_cipher("d", -2)
#puts "a and z shifted by 2"
#p caesar_cipher("az", 2)
#puts "A and Z shifted by 2"
#p caesar_cipher("AZ", 2)
#puts "watch for CASES shifted by 4"
#p caesar_cipher("watch for CASES", 4)
#puts "THIS is very SeNsItIvE to CAse and special characters?!., shifted by 1"
#p caesar_cipher("THIS is very SeNsItIvE to CAse and special characters?!.,", 1)
#puts "-+-+-+ shifted by 4 should be invalid because of not accepted characters"
#p caesar_cipher("-+-+-+", 4)
#puts "some text shifted by 55, should be invalid because it wraps around the alphabet"
#p caesar_cipher("some text", 55)

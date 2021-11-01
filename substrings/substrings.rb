words = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(sentence, dictionary)
  dict_hash = {}                                                        #create empty hash
  dictionary.each { |word| dict_hash[word] = 0 }                        #set has keys and key values to zero otherwise its nil and +1 would not work
  sentence_words_array = sentence.split(" ")                            #convert the words of the sentence into an array
  sentence_words_array.map! { |word| word.downcase }                    #downcase the words because include? is case sensitive
    sentence_words_array.each do |sentence_word|                        #start iterating through the words of the sentence
      dictionary.each do |dictionary_word|                              #start iterating through the words of the dictionary
        if sentence_word.include?(dictionary_word)                      #check if the current word from the sentence matches the current word of the dictionary
          dict_hash[dictionary_word] += 1                               #if yes increase the appropiate key´s value by 1
        end
      end
    end
  dict_hash.delete_if { |key, value| value == 0 }                       #clear up the hash from unused words
  dict_hash                                                             #return the hash
end

p substrings("Howdy partner, sit down! How's it going?", words)
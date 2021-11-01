# Implement a method #stock_picker that takes in an array of stock prices, 
# one for each hypothetical day. It should return a pair of days representing 
# the best day to buy and the best day to sell. Days start at 0.
# basically find the biggest difference between two numbers with extra steps
stonks = [17,3,6,9,15,8,6,1,10]

def stock_picker(array)

  unmodified_array = array.clone  #has to be .cloned otherwise it points to the same part of the memory and will be changed if I make changes to the stonks array
  stored_difference = 0           #this will also be the profit
  current_difference = 0          #the current difference that is being measured
  buying_day = 0                  #this is index + 1 on which day to buy lowest
  selling_day = 0                 #this is index + 1 on which day to sell for max profit

  while array.length > 1 do 
    array.each_with_index do |value, index|
      current_difference = value - array.first                  #looping through the items in the array, subtracting the first element of the other elements and storing the difference
      if current_difference > stored_difference                 #if the latest difference is higher than the currently stored highest one, 
        stored_difference = current_difference                  #store it as the new highest difference
        buying_day = unmodified_array.index(array.first) + 1    #buy on the day of the current array.first that is being compared
        selling_day = unmodified_array.index(value) + 1         #sell on the day of the kivonandó
      end
    end
    array.shift                                                 #removes the first element of the array
  end

  puts "Buy on day #{buying_day} and sell on day #{selling_day} for a profit of #{stored_difference} cents."

end

stock_picker(stonks)
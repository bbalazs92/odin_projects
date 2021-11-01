sort_this = [4,3,78,2,0,2]
array1 = [8, 3, 6, 2, 4, 9, 7, 1, 5]

def bubble_sort(array)

temp = 0
i = 0

  array.length.times do
    array.each_with_index do |value, index|
        if array[index + 1]
          if array[index] > array[index + 1]
            temp = array[index]
            array[index] = array[index + 1]
            array[index + 1] = temp
          end
        end
    end
  end
  p array
end

#bubble_sort(sort_this)
bubble_sort(array1)
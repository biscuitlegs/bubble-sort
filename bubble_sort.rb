#!/usr/bin/ruby

class Array
    def swap(first, second)
        self[first], self[second] = self[second], self[first]
    end
end


def bubble_sort(array)
    bubble_array = array.dup
    
    array.length.times do
        bubble_array.each_with_index do |current_element, current_index|
            break if current_index == bubble_array.length-1

            next_element = bubble_array[current_index + 1]
            next_index = current_index + 1

            current_element > next_element ? bubble_array.swap(current_index, next_index) : next
        end
    end

    bubble_array
end

def bubble_sort_by(array, &block)
    bubble_array = array.dup

    array.length.times do
        bubble_array.each_with_index do |current_element, current_index|
            break if current_index == bubble_array.length-1

            next_element = bubble_array[current_index + 1]
            next_index = current_index + 1

            yield(current_element, next_element) > 0 ? bubble_array.swap(current_index, next_index) : next
        end
    end

    bubble_array
end


puts bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length}
puts ""
puts bubble_sort([4, 3, 78, 2, 0, 2])
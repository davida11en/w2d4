require "byebug"
# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(*nums)
    highest = nums.max
    i = highest
    while true 
        return i if nums.all?{|num| i % num == 0}
        i += highest
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigs = []
    (0...str.length - 1).each do |i|
        pair = str[i] + str[i + 1]
        bigs << pair
    end
    count = Hash.new(0)
    bigs.each do |el|
        count[el] += 1
    end
    count.max_by{|k,v|v}[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        newhash = {}
        self.each do |k,v|
            newhash[v] = k
        end
        newhash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |el1, i1|
            self.each_with_index do |el2, i2|
                if i2 > i1 && el1 + el2 == num
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        
        sorted = false
        while !sorted
            sorted = true
            (0..self.length - 2).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
            # debugger
        end
        self
    end
end

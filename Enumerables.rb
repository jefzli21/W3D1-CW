require "byebug"

class Array 

    def my_each(&prc)
    
        i = 0 
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    
    end

    def my_select(&prc)
    
        new = []
        # debugger
        self.my_each do |i|
            if prc.call(i)
                new << i
            end
        end
        new
    
    end

    def my_reject(&prc)
    
        new = []
        self.my_each do |i|
            if prc.call(i) == false
                new << i
            end
        end
        new
    
    end

    def my_any?(&prc)
        self.my_each do |i|
            if prc.call(i) 
                return true
            end
        end
        return false
    end

    def my_all?(&prc)
        count = 0
        self.my_each do |i|
            if prc.call(i)
                count += 1
            end
        end
        # if self.length == count
        #     return true
        # else 
        #     return false
        # end
        self.length == count
    end

    def my_flatten
        # return[self] if !self.is_a?(Array)
        new_arr = []
        # self.each_with_index do |ele, i|
        #     new_arr += self[i].my_flatten
        # end
        self.each do |ele|
            if ele.is_a?(Array)
                new_arr += ele.my_flatten
            else
                new_arr += [ele]
            end
        end
        return new_arr
    end

    def my_zip(*arg) # args = []
        empty_arr = []
        new_arr = self.length

        i = 0
        while i < self.length
            arg.each do |ele|


            new_arr << ele
            i += 1
        end
        return new_arr
    end

end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# my_any, my_all
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

#my_reject
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

#my_select
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


#my_each
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end
#    # => 1
#        2
#        3
#        1
#        2
#        3
   
#    p return_value  # => [1, 2, 3]
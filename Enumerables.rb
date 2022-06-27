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


end

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
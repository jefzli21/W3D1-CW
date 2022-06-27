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

        new_arr = []

        i = 0
        while i < self.length
            arr = [self[i]]
            arg.each do |ele|
                arr << ele[i]
            end
            new_arr << arr
            i += 1
            
        end
        return new_arr
    end

    def my_rotate(n)
        if n > 0 
            n.times do 
                first = self.shift
                # p first 
                self.push(first)
                # p self
            end
            return self
        else
            abs_n = n*-1
            abs_n.times do 
                last = self.pop
                self.unshift(last)
            end
            return self

        end
    end

    def my_join(str="")
        new = ""
        
        self.each do |i|
            new += i + str
        end
        new
    
    
    end

end

#my_join
a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

#myrotate
# a = [ "a", "b", "c", "d" ]
# b = [ "a", "b", "c", "d" ]
# c = [ "a", "b", "c", "d" ]
# d = [ "a", "b", "c", "d" ]
# p a.my_rotate(1)      #=> ["b", "c", "d", "a"]
# p b.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p c.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p d.my_rotate(15)     #=> ["d", "a", "b", "c"]


#my_zip
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]





#flatten
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


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
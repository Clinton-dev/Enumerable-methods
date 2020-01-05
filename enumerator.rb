module Enumerable
  def my_each
    y = []
      for x in self
        y << yield(x)
      end 
      puts y
  end
  
  def my_each_with_index
      y = []
      for e in self
       y << yield(self[e],e)
      end
      puts y
  end

  def my_select
    result = []
    self.my_each do |i| 
      if yield(i)
       result << i
      end
    end
    return result
  end

  def my_all?
    all = true
   self.my_each do |i|
      all = false if yield(i) == false
   end
   return all
  end

  def my_any?
    all = false
    for i in self
     all = true if yield(i)
    end
    all
  end

  def my_none?
    all = false
    for i in self
     all = true if yield(i) == false
    end
    return all
   end

   def my_count 
    n = 0
    for i in self
     if yield(i) 
       n = n + 1
     end
    end
    return n
   end
 
   def my_map
    new = []
    for i in self
     new.push(yield(i))
    end
    return new
   end

   def my_inject
    result  = 0
    for i in self 
     result = yield(result,i)
    end
    return result
   end
end

  arr  = [4,5,1,2]
  
  include Enumerable
  
  arr.my_each {|n|  n += 1}
 # arr.my_each_with_index {|n,indx| puts indx += 1}
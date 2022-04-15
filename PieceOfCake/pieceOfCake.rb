module ClassModule
    def sample(size)
   if size < 0 
          raise ArgumentError.new "this method doesnt accept negative parameter"
    end
      return Array.new(size) { rand(100) }
    end
    
  end
  
  module InstanceModule
      def square
        return self * self
      end
  end
  
  class Integer
    include InstanceModule
    include ClassModule
    alias_method :random, :sample
      def factorial
        if self < 0 
          raise RuntimeError.new "this method doesnt accept negative parameter"
        end
        return (1..self).inject(:*)
      end
  end
  
  positiveInteger = 4
  negativeInteger = -4
  puts(positiveInteger.factorial)
  # puts(-8.factorial)
  puts(positiveInteger.square)
  puts(negativeInteger.square)
  puts(positiveInteger.sample(positiveInteger))
  # puts(positiveInteger.sample(negativeInteger))
  puts(positiveInteger.random(positiveInteger))
  
  
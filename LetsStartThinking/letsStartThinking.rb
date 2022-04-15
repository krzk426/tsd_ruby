class LetsStartThinking
  
    def combinations(arrayOfIntegers)
      arrayOfIntegers.combination(4).to_a.map {|n| 
        n.inject(:+)}.minmax
    end
    
    def decimal(number)
      cnt = number.length-1
      res = 0
        number.split('').each{|n|  res+=n.to_i*(2**cnt); cnt-=1}
  
      return res
    end
  
    def count_words(phrase)
      return phrase.split(' ').group_by(&:itself).transform_values(&:count)
    end
  
    def pangram(phrase)
      return ('a'..'z').all? {|n| phrase.downcase.include? n}
    end
    
  end
  
  
  a = LetsStartThinking.new()
  puts a.combinations([1,2,3,4,5])
  puts a.decimal("1000")
  puts a.count_words("olly olly come here free")
  puts a.pangram("The quick brown fox jumps over the lazy dog.")
  puts a.pangram("abcd")
  
  
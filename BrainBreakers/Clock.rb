class Clock 
  attr_accessor :hour, :minute , :sec
  def initialize(hour, minute, sec)
    @hour = hour
    @minute = minute 
    @sec = sec
  end

  
  def +(time)
      @sec += time.sec 
      @minute += @sec / 60
      @sec = @sec % 60
      @minute += time.minute
      @hour += @minute / 60
      @minunte = @minute % 60
      @hour = (@hour + time.hour) % 24 
    return Clock.new(@hour, @minute, @sec)
  end
  
  def -(time)
    @sec -= time.sec
    @minute += @sec/60
    if @sec < 0  
    @sec += 60 
    end
    @minute -= time.minute
    @hour += @minute/60
    if @minute < 0
      @minute += 60
    end
    @hour -= time.hour
    if @hour < 0
      @hour += 24
    end
    return Clock.new(@hour, @minute, @sec)
  end

  def ==(time)
     return @hour==time.hour && @minute == time.minute && @sec == time.sec ?  true :  false
  end
  
   def measure_time
       puts "Something is happening here"
      sleep 3
      self.+(Clock.new(0,0,3))
      self.print
     
    end
  
  def print
    puts "The current time is #{@hour}:#{@minute}:#{@sec}"
    end
end

time1 = Clock.new(10, 10, 10)
time2 = Clock.new(10, 11, 11)
time1.print
time2.print 
time1 += time2
time1.print
time1 -= time2
time1.print
puts time1 == time2
puts time1 == Clock.new(time1.hour, time1.minute, time1.sec)
time1.print
Clock.new(10,10,10).measure_time

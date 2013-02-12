

class Sample

  def show_me
    puts "Hello, World!"
  end

  def show_me_more param1
    puts param1
  end

  def self.say message
    puts "Sample: " + message.to_s
  end

end

s = Sample.new
s.show_me_more "w00t"

# why not work with 's' -- "cannot access class method"
Sample.say "wow"


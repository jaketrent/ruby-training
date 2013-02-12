
# test class type
puts 4.class

# reopen the class and modify it
class Fixnum
  def dozen
    self * 12
  end
end

puts 4.dozen
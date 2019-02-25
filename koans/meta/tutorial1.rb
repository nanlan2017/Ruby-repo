def to_alphanumeric(s)
  s.gsub(/[^\w\s]/, '')
end

puts to_alphanumeric("A&^ar$o%n&* (is&*&))) t&*(*he B0&*S**^S)")
# => "Aaron is the B0SS"


class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end

puts "A&^ar$o%n&* (is&*&))) t&*(*he B0&*S**^S)".to_alphanumeric
# => "Aaron is the B0SS"
#**********************************************************************************************************************
class Array
  def replace2(original, replacement)
    self.map {|e| e == original ? replacement : e }
  end
end

puts %w{x y z}.replace2('x', 'a')  #=> Array#replace本已存在！

# => a, y, z
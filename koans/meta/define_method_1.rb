#################   PART-1  动态定义方法   ######################
def foo
  puts "foo was called"
end

def baz
  puts "baz was called"
end

def barx
  puts "barx was called"
end

foo
baz
barx

# => foo was called
# => baz was called
# => barx was called

#**********************************************************************************************************************
%w{foo baz barx}.map do |method_name|
  define_method(method_name) do    # Module#define_method
    puts "#{method_name} was called"
  end
end

foo
baz
barx
#################   PART-2  动态调用方法   ######################
%w(test1 test2 test3 test4 test5).each do |s|
  define_method(s) do
    puts "#{s} was called"
  end
end

# New Code
(1..5).each { |n| send("test#{n}") }  # Object#send

# => test1 was called
# => test2 was called
# => test3 was called
# => test4 was called
# => test5 was called
#**********************************************************************************************************************
class Book
end

b = Book.new
# b.read   # 无此方法！
#--------------------------
class Book
  def method_missing(method, *args, &block)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

b = Book.new

b.read
b.read('a', 'b') { "foo" }

# => You called: read()
# => You called read(a, b)
# => (You also passed it a block)

#**********************************************************************************************************************
Book = Class.new do
  def foo
    "foo!"
  end

  #Both method declaration types work

  define_method('title') do
    "All My Friends Are Dead"
  end
end

puts Book.new.foo
puts Book.new.title

# => foo!
# => All My Friends Are Dead
#
# -------------------------------
my_var = "Success"

MyClass = Class.new do
  "#{my_var} in the class definition"

  # Have to use dynamic method creation to access my_var
  define_method :my_method do
    "#{my_var} in the method"
  end
end

puts MyClass.new.my_method

# => Success in the method
#**********************************************************************************************************************
class Book
  def initialize
    @v = 1  # => Private variable
  end
end

obj = Book.new

x = 2
obj.instance_eval { @v = x }
puts obj.instance_eval {@v}

# => 2
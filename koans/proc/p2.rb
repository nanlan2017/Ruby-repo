require 'p1'
undef do_twice

def calculate_value(x, y, *otherValues) # 理解成数组参数
  puts otherValues
end

calculate_value(1, 2, 'a', 'b', 'c') #=>


#--------------------------------------------------------------------
def accepts_hash(var)
  print "got: ", var.inspect # will print out what it received
end

# => got: {:argN=>"giving argN", :arg1=>"giving arg1"}
accepts_hash :arg1 => 'giving arg1', :argN => 'giving argN'
accepts_hash(:arg1 => 'giving arg1', :argN => 'giving argN') # argument list enclosed in parens
accepts_hash({arg1: 'giving arg1', argN: 'giving argN'}) # hash is explicitly created
accepts_hash( :arg1 => 'giving arg1', :argN => 'giving argN' )  { |s| puts s }
accepts_hash( { :arg1 => 'giving arg1', :argN => 'giving argN' } )  { |s| puts s }

#--------------------------------------------------------------------
def gen_times(factor)
  return Proc.new {|n| n*factor }  # partial applyment ： 得到新的函数     factor-> (n->n)
end

times3 = gen_times(3)      # 'factor' is replaced with 3
times5 = gen_times(5)

times3.call(12)               #=> 36
times5.call(5)                #=> 25
times3.call(times5.call(4))   #=> 60

=begin
Proc ： 就是 Function Object

=end
def foo (a, b)
  a.call(b)
end

putser = Proc.new {|x| puts x}  # putser = lambda {|x| puts x }
foo(putser, 34)

# 用 Proc.new 和 用 lambda 新建的 Proc 对象有两点区别
# 1. lambda 里参数的每个符号就代表一个变量，不会匹配多个
# 2. return 的语义不同：Proc.new 会停止整个方法--- 内部调用了这个proc 函数的那个方法
#                     而 lambda 只会返回lambda 这一步
#--------------------------------------------------------------------
def say (something)
  puts something
end

say "Hello"
Object.send(:say, "Hello") # this will be the same as the above line

# - - - - - - -- - -  -
say = lambda {|something| puts something}

say.call("Hello")

# same effect
say["Hello"]
#--------------------------------------------------------------------
# ▆▆▆▆▆▆▆▆▆▆▆▆▆▆  Block， 是 unborned  Proc
# 要把 Proc 对象 和 Block 区别开  ！
# ▆▆▆▆▆▆▆▆ 如果只需要一个函数参数的时候，就可以作为 block 放在最后。（否则就需要用 Proc::new/ lambda 来显式构造成为参数）
# Whenever a block is appended to a method call,
# Ruby automatically converts it to a Proc object but one without an explicit name.
# The method, however, has a way to access this Proc, by means of the yield statement
10.times do |i|
  print "#{i} "
end

numbers = [1, 2, 5, 6, 9, 21]

numbers.each do |x|
  puts "#{x} is " + (x >= 3 ? "many" : "few")
end

squares = numbers.map {|x| x * x}
#--------------------------

# 只需要一个 Proc 作为参数时，可以作为最后的block
def do2
  yield
  yield
end

do2 {puts '2'}
=begin
def do_twice(what)  <---- 写成显式的后，就说明这个参数必须是 Proc，而不能是 Block
      what.call
      what.call
  end

  do_twice lambda {puts "Hola"}
=end
#▆▆▆▆▆▆ Using the Proc approach, any amount of code blocks can be passed
# ▆▆▆▆▆▆ 也就是说只有一个 Block的话，函数的签名为  f :: a-> b -> (c->d->e) -> h
#           那么 f va 就得到一个新的
#
#--------------------------▆▆▆▆最后一个参数是 &block 时，仍让需要用block 来传给它、而非 Proc
def contrived(a, &f)
  # the block can be accessed through f
  f.call(a)

  # but yield also works !
  yield(a)
end

# this works
contrived(25) {|x| puts x}

# this raises ArgumentError, because &f
# isn't really an argument - it's only there
# to convert a block
# contrived(25, lambda {|x| puts x})
#--------------------------
print "(t)imes or (p)lus: "
times = gets
print "number: "
number = Integer(gets)
if times =~ /^t/
  calc = lambda {|n| n*number }
else
  calc = lambda {|n| n+number }
end
puts((1..10).collect(&calc).join(", "))
# & ：① 用在被调用函数（最后一个参数）：将block 转为 Proc  ②用在调用处，将 Proc 转为block
#
class Symbol

  # A generalized conversion of a method name
  # to a proc that runs this method.
  #
  def to_proc
    lambda {|x, *args| x.send(self, *args)}
  end

end

# Voilà !
words = %w(Jane, aara, multiko)
upcase_words = words.map(&:upcase)  # 实际是 :upcase 这个Symbol 被调用 Symbol::to_proc ，然后proc 再被& 转为 block
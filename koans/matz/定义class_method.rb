class HelloWorld;end

def HelloWorld.hello1(name)
  puts "#{name} said hello1."
end

#=======================================================================
#  class << 类名 ~ end
#    hello2 就是 singleton method， 并使得 HelloWorld成为 eigenclass
class << HelloWorld
  def hello2(name)
    puts "#{name} said hello2."
  end
end

HelloWorld.hello2("John")    #=> John said hello.

#=======================================================================
# class << self ~ end
class HelloWorld
  class << self   # 和上面是一样的
    def hello3(name)
      puts "#{name} said hello3."
    end
  end
end
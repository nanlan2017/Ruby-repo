class MyClass
  def my_method
    def inner_method
      puts "inner..."
    end
  end
end

#⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵
obj = MyClass.new
obj.my_method
obj.inner_method  #=> "inner..."
#⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴
p "----------------- 行#{__LINE__ } ------------------->"

require File.dirname(__FILE__ )+'/object_picture'
puts self.class  #=> Object
puts self.to_s   #=> main
def my_method         # ▇▇▇▇ 在'顶层环境'（main:Object)中定义的方法  （self为 main::Object)  ----- 该method成为Object的instance method (private)
  puts 'my_method...'
end
class Test < Object
 def test
   my_method      # ob
 end
end

Test.new.test  #=> my_method...
# Object.new.my_method  # in `<top (required)>': private method `my_method' called for #<Object:0x00007f7fc999be48> (NoMethodError)

#**********************************************************************************************************************
=begin
     Module # class_eval()
可以使用class关键字打开一个类，但是这必须首先知道类的名字。
Ruby提供了方法Module#class_eval()方法来处理不知道类名，却想打开一个类的情况
=end
def add_method_to(classname)
  classname.class_eval do   #<------ 用 class_eval 来打开一个类（▇▇▇▇后面的代码会被代入目标Class中运行）
    def sample_method
      puts 'added sample method running...'
    end
  end
end

#⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵
p "----------------- 行#{__LINE__ } ------------------->"
add_method_to(MyClass)
MyClass.new.sample_method
#⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴
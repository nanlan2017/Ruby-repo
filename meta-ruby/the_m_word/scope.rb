v1 = 1

class MyClass
  attr_accessor :v2
  v2 = 2

  @class_ins_var = 5

  def my_method
    v3 = 3
    #▇▇▇▇▇▇▇▇ v4 = v2 + v3 # v2已经不可见了！（Ruby中不存在嵌套作用域）
    local_variables
  end

  local_variables

end

# test
obj = MyClass.new
p obj.my_method
p obj.my_method
p local_variables
p obj.v2  # 其实也是个方法（attr_accessor生成了 v() 和 v=() 两个接口方法

p obj.class_ins_var
p MyClass.class_ins_var

#####################################################################
myvar = 'myvar'

# class TestClass

  # p myvar
  #
  # def test_method
  #   p myvar
  # end

# end

#------>  flat the scope gate : (三大作用域门：class~end, module~end, def~end)
#         可以通过block将当前作用域中的bindings传给它们

TestClass = Class.new do
  p myvar

  # def test_method2  #---->  这样也是不行的（def~end仍然构成了Scope Gate
  #   p myvar
  # end

end

TestClass.define_method(:test_method2) do
  p myvar
end

#test
obj = TestClass.new
obj.test_method2

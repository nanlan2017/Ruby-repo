class C
  def a_method
    'C#a_method()'
  end
end

class D < C;end

# test
obj = D.new
obj.a_method

class << obj
  def a_singleton_method
    'obj#a_singleton_method()'
  end
end

p obj.class  # 是D
p obj.singleton_class  # 不是D，而是一个匿名的 singleton class (为D的派生类)

class C
  class << self
    def a_class_method
      'C.a_class_method()'
    end
  end
end
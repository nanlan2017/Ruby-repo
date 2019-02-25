module M
  class C
    X = 'a const in M::C'
    module Inner
      p Module.nesting   # show path =>  M::C::Innner  ,    M::C ,   M
    end
  end
  C::X
end
M::C::X

Y = 'a root-level constant'
module M
  Y = 'a const in M'
  Y
  ::Y
end

p M.constants  # M是Module类的实例。 Module#constants 返回该Module下（直接的）的常量
 #=> [:C , :Y]
p Module.constants.include?(:Object) # Module.constants 返回当前系统中所有的顶层常量（包括模块名、类名）
p Module.constants.include?(:Module)

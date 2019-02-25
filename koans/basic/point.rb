# 重载二元运算符
class Point
  attr_reader :x, :y
  attr_accessor :y

  def initialize(x=0, y=0)
    @x, @y = x, y
  end

  def inspect  # 用于显示
    "(#{x}, #{y})"
  end

  def +(other)  # x、y 分别进行加法运算
    self.class.new(x + other.x, y + other.y)
  end

  def -(other)  # x、y 分别进行减法运算
    self.class.new(x - other.x, y - other.y)
  end

  # protected :+
end

point0 = Point.new(3, 6)
point1 = Point.new(1, 8)

p point0           #=> (3, 6)
p point1           #=> (1, 8)
p point0 + point1  #=> (4, 14)
p point0 - point1  #=> (2, -2)
##############################################################################
#重载一元运算符
class Point

  def +@
    dup                     # 返回自己的副本
  end

  def -@
    self.class.new(-x, -y)  # 颠倒x、y 各自的正负
  end

  def ~@
    self.class.new(-y, x)   # 使坐标翻转90 度
  end
end

point = Point.new(3, 6)
p +point  #=> (3, 6)
p -point  #=> (-3, -6)
p ~point  #=> (-6, 3)

##############################################################################
# []下标运算符 （并且读取 区别于  赋值）
class Point

  def [](index)
    case index
    when 0
      x
    when 1
      y
    else
      raise ArgumentError, "out of range `#{index}'"
    end
  end

  def []=(index, val)
    case index
    when 0
      self.x = val
    when 1
      self.y = val
    else
      raise ArgumentError, "out of range `#{index}'"
    end
  end
end
point = Point.new(3, 6)
p point[0]           #=> 3
p point[1] = 2       #=> 2
p point[1]           #=> 2
p point[2]        #=> 错误（ArgumentError）
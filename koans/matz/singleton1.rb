# 在Ruby中，"单键"具有3种含义
# 1. 指单例模式：即一个类只能有1个instance （常用来存储全局状态）
# 2. singleton method : 指为一个instance添加的method、而非为class添加的
# 3. singleton class = eigenclass : 指具有上述singleton method的 那个instance

class PointState
  include Singleton

  def initialize
    @n, @total_x, @total_y = 0, 0.0, 0.0
  end

  def record(point)
    @n += 1
    @total_x += point.x
    @total_y += point.y
  end
end

class Point
  def initialize(x,y)
    @x,@y = x,y
    PointState.instance.record self  # 关键是这一行
  end
end
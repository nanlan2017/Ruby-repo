def counter  # 函数对象（在 C++里是个类+重载()函数调用运算符）
  c = 0

  Proc.new do
    c += 1
  end
end

def counter2
  c = 0

  Proc.new do # 一个匿名函数
    c += 1
  end

  Proc.new do
    c += 2
  end
end

counter3 = Proc.new {|x| x+1}

# c1计时器 （此counter 函数还维护着自己的 状态，成为闭包）
c1 = counter
p c1.call
p c1.call
p c1.call

# c2计时器
c2 = counter2
p c2.call
p c2.call

p counter.call
p counter.call



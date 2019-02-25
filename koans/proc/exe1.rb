def my_collect(arr,&proc)
  rarr = Array.new
  arr.each do |x|   # 这地方每个元素传递给 x， 用的是值拷贝吧！
    rarr << proc[x]
  end
  rarr
  # arr.each {|x| yield x}
end

ary = my_collect([1, 2, 3, 4, 5]) do |i|
  i * 2
end

p ary  #=> [2, 4, 6, 8, 10]


#--------------------------------------------------
to_class = :class.to_proc  # 把一个method 转为 Proc 对象
p to_class.call("test")    #=> ??  p "test".class
p to_class.call(123)       #=> ??
p to_class.call(2 ** 1000)        #=> ??

#--------------------------------------------------
def accumlator
  total = 0
  Proc.new do |x|
    total += x
  end
end

acc = accumlator
p acc.call(1)    #=> 1
p acc.call(2)    #=> 3
p acc.call(3)    #=> 6
p acc.call(4)    #=> 10

def acc2
  total = 0
  var2 = 7

  Proc.new do |x|
    # total += x
    p "test #{var2}" # 这里才是这个函数对象的返回值
  end

  Proc.new do |x|    ##### 最终结果看最后的那个 Proc 定义 (前面的被覆盖了，压根不会运行到)
    total += x
  end
end

acccc = acc2  # 这里 acc2和 accc 是同一个性质的东西吗？？
p acccc[1]
p acccc[2]
p acccc[3]

p acc2[100]

alias acc22 acc2
p acc22[10]
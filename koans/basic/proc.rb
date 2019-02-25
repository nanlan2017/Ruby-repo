hello_proc = Proc.new do |name|
  p "hello,#{name}"
end

hello_proc.("world")

# 一般的，一个函数是否在最后接收一个 do-block 作为参数，只能从该函数体内是否含有 yield/ block_given? 来判断
#
# 若 f1 接收block 参数，且f1内部调用了f2, 为了将f1的block 参数转发去f2， 需要给此block 参数显式命名，即： &block
#
def call_each(ary, &block)
  ary.each(&block)
end

call_each [1, 2, 3] do |item|
  p item
end


ary = []
10.times do |i|
  ary << i
end
p ary    #=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

ary = []
2.step(10, 3) do |i|
  ary << i
end
p ary    #=> [2, 5, 8]

ary = []
10.step(2, -3) do |i|
  ary << i
end
p ary    #=> [10, 7, 4]
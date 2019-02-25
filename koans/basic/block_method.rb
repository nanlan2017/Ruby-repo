def myloop
  while true # 这个true 是根据什么判断的（应该是do-block 中的break 条件）
    yield # run do-block
  end
end

=begin
yield 部分有参数，程序就会将其当作块变量传到块里。
块里面最后的表达式的值既是块的执行结果，同时也可以作为 yield 的返回值在块的外部使用
=end

num = 1
myloop do
  puts "current :#{num}"
  break if num > 100
  num = num * 2
end

#----------------------------------------------
def a(a, *b, c)
  [a, b, c]
end

p a(1, 2, 3, 4, 5) #=> [1, [2, 3, 4], 5]
p a(1, 2) #=> [1, [], 2]


def bar(arg1, arg2)
  [arg1, arg2]
end

p bar(100, {"a" => 1, "b" => 2}) #=> [100, {"a"=>1, "b"=>2}]
p bar(100, "a" => 1, "b" => 2) #=> [100, {"a"=>1, "b"=>2}]
p bar(100, a: 1, b: 2) #=> [100, {:a=>1, :b=>2}]
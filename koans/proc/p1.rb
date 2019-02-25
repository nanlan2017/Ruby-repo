arr1 = %w{a b e}
r = arr1.reduce{|acc,x| acc+x }  #相当于foldl0  :: reduce fblock (acc) arr1
p r

proc_hello = proc do |name|
  puts "hello,#{name}"
end

# 以下3种调用是一样的
proc_hello.call('world')
proc_hello.('world')  # 这个是语法糖，而非 method alias
proc_hello['world']

# Proc对象 就是函数、可以作为变量传递的函数


# 实现take_while，有必要使用break 终止each 迭代
=begin
  那么
=end

def do_twice(what1, what2, what3)
  2.times do
    what1.call
    what2.call
    what3.call
  end
end

do_twice(   lambda {print "Hola, "},
            lambda {print "querido "},
            lambda {print "amigo\n"})
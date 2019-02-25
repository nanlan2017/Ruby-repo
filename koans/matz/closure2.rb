def multiply(data,n)
  data.collect {|x| x*n }
end

puts multiply([1,2,3],5)


def multiplier(n)    # 就相当于partial apply嘛！    :: n -> data -> r
  ->(data){data.collect {|x| x*n }}
end
p "----------------- 行#{__LINE__ } ------------------->"
doubler = multiplier(2)
puts doubler.call([1,2,3])
p "----------------- 行#{__LINE__ } ------------------->"
# eval("n=3",doubler.binding)
doubler.binding.eval('n=3')
puts doubler.call([1,2,3])
# doubler.binding.
#-------------------------------------------
def accesor_pair (init_value)
  value = init_value
  getter = lambda {value}
  setter = lambda {|x| value=x}
  return getter,setter
end

getX,setX = accesor_pair(10) # 这个"10"的Integer instance已经被 getter,setter这两个 reference varible引用
puts getX[]
setX[20]
puts getX[]

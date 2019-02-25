def f
  shared = 0

  send :define_method , :counter do
    shared
  end

  Kernel.send :define_method , :inc do |x|
    shared += x
  end

end

# test
f
p counter
p inc 2
p counter

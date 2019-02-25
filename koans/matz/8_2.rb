M = Module.new
C = Class.new
D = Class.new(C) {include M}
p D.to_s
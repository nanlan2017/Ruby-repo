# 用 collect 方法处理用 each_line 方法获取的行
str = "壹\n 贰\n 叁\n"
tmp = str.each_line.collect do |line|
  line.chomp  3
end
p tmp    #=> ["壹壹壹", "贰贰贰", "叁叁叁"]

# 用 collect 方法处理用 each_byte 方法获取的数值
str = "abcde"
tmp = str.each_byte.collect do |byte|
  -byte
end
p tmp    #=> [-97, -98, -99, -100, -101]
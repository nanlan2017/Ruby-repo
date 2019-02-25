# ------- 方式1：times ----------------
10.times do |i|
  puts "第#{i + 1}次循环..."  # i会从0~times 去匹配
end
# ------- 方式2：for ----------------
          # for 在ruby里就是用each 实现的
sum = 0
for i in 1..10 # do
  sum += i
end

# ------- 方式3: while ----------------
sum = 0
i = 1
while i <= 5
  sum += i
  i += 1
end
puts sum

# ------- 方式4: until: while 的反义（把while 换成until 即可） ----------------
          # 就像 if 与 unless 一样
sum = 0
i = 1
until sum >= 50
  sum += i
  i+= 1
end
puts sum

# ------- 方式5：each ----------------


# ------- 方式6: loop (+break) ----------------

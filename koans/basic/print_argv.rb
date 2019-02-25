=begin
puts "首个参数: #{ARGV[0]}"
puts "第2 个参数: #{ARGV[1]}"
puts "第3 个参数: #{ARGV[2]}"
=end

# ------------------------------------------
filename = ARGV[0]
file = File.open(filename)
file.each_line do |line|   # 逐行载入内存，故内存不再要求一次性的大小
  puts line
end
file.close
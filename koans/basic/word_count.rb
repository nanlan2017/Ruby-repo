count = Hash.new(0)

File.open('chap1.rb').each_line do |line|
  line.split.each do |word|
    count[word] += 1
  end
end

count.sort {|a, b|
  a[1] <=> b[1] #按value（统计次数） 的从小到大排序
}.each do |k, v|
  p "#{k}:#{v}"
end
def total (from ,to)
  result = 0
  from.upto(to) do |num|
    if block_given?         # block_given
      result += yield(num)
    else
      result += num
    end
  end
end

p total(1, 10)                  # 从1 到10 的和 => 55
p total(1, 10){|num| num ** 2 } # 从1 到10 的2 次幂的和 => 385
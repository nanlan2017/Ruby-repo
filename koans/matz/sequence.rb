class Sequence # ruby里那个多态的 Array 是如何实现的？其 index 方法？（按 Object 来嘛？)

  def initialize(from, to, by)
    @from, @to, @by = from, to, by
  end

  def each
    x = @from
    while x <= @to
      yield x # block 有返回值吗？ 应该有：res_arr << proc[x]
      x += @by
    end
  end

  def length
    return 0 if @from > @to
    Integer((@to - @from) / @by) + 1
  end

  alias size length

  def [](index)
    return nil if index < 0
    v = @from + @by * index
    if v >= @to
      nil
    else
      v
    end
  end

  def *(factor)
    Sequence.new(@from*factor,@to*factor,@by*factor)
  end

  def +(offset)
    Sequence.new(@from+offset,@to+offset,@by)
  end
end

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
s = Sequence.new(1,10,2)
# s.each(&:p)  # 先:p 是 Symbol.to_proc 得到 Proc 对象，再由&将 Proc转为block
=begin
in `each': private method `p' called for 1:Integer (NoMethodError)
=end
s.each {|x| p x}
p s.size
p s[3]
p s*2
p s+2
# ////////////////////////////////////////////
module Sequence2
  def self.fromtoby(from,to,by,&f)
    x = from
    while x <= to
      yield x
      x += by
    end
  end
end
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
p "----------------- 行#{__LINE__ } ------------------->"
Sequence2.fromtoby(1,10,2) {|x| p x}
# ////////////////////////////////////////////
class Range
  def by(step,&f)
    x = self.begin
    if exclude_end?
      while x < self.end
        yield x
        x += step
      end
    else
      while x <= self.end
        yield x
        x += step
      end
    end
  end
end

#⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵
p "----------------- 行#{__LINE__ } ------------------->"
(1...10).by(2) {|x| p x}
#⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴⤴





















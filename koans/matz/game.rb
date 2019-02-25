# 测试用例：
# Soduku.solve(Soduku::Puzzle.new(ARGF.readlines))

module Soduku

  class Puzzle

    ASCII = ".123456789"
    BIN = "\000\001\002\003\004\005\006\007\010\011"

    def initialize(lines)
      if lines.respond_to?(:join)
        @s = lines.join
      else
        @s = lines.dup
      end
    end

    # 去除s 中的空格
    @s.gsub!(/\s/, "")

    # 校验：共81个cell
    raise Invalid, "Grid is of wrong size" unless @s.size == 81

    # 校验：@s 中是否有非法字符
    if i = @s.index(/[^123456789\.]/)
      raise Invalid, "Illegal Charactor #{@s[i, 1]} in puzzle"
    end

    @s.tr!(ASCII, BIN)
    @grid = @s.unpack("c*") # unpack bytes into Array of Numbers

    if has_duplicates?
      raise Invalid, "Init puzzle has duplicates!"
    end

    # 检查当前9x9 是否违法规则
    def has_duplicates?

    end

    # @!method 将puzzle 内容打印出来
    def to_s
      (0..8).collect {|row| @grid[row * 9, 9].pack('c9')}.join("\n").tr(BIN, ASCII)
    end

    # override Object.dup to copy the @grid Array
    def dup
      copy = super
      @grid = @grid.dup
      copy
    end

    def [](row, col)          # ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ Ruby 中所有的基本类型都是对象：所以不存在"基本类型用值拷贝"这样的说法
      @grid[row * 9 + col]    # ▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 最后的这个返回值肯定是像 Java 一样用引用传递啦！（instance 都放在堆上！）
    end

    def []=(row,col,newvalue) # 为什么要专门定义这个运算？ puzzle[x,y]不是已经获取到了那个cell 的引用吗？ 不可以直接赋值？
      unless (0..9).include? newvalue
        raise Invalid, "illegal new value !"
      end
      @grid[row,col] = newvalue
    end

    def each_unknown

    end

    def possible

    end
  end

  class Invalid < Exception

  end
end




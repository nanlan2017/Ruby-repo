# 测试
class MegaGreeter
  # 姓名
  attr_accessor :names

  def initialize(names = 'World')
    @names = names
  end

  def sayhi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      @names.each do |name| #相当于 Haskell 的map
        puts "hello,#{name}"
      end
    else
      puts "hello,#{@names}"
    end
  end

  def saybye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      puts "byebye,peoples,#{@names.join(", ")}"
    else
      puts "Goodbye #{@names}"
    end
  end

end

if __FILE__ == $0
  mg = MegaGreeter.new
  mg.sayhi
  mg.saybye

  # change name to "Jack"
  mg.names = 'Jack'
  mg.sayhi
  mg.saybye

  # 多个名字
  mg.names = ["Alpha", "belta", "delta"]
  mg.sayhi
  mg.saybye

end
class Roulette # 轮盘
  def method_missing(name,*args,&blk)
    person = name.to_s.capitalize
    super unless %w[Bob Frog Jack].include?(person)
    number = 0
    3.times do
      number = rand(10) +1
      puts "#{number}..."
    end
    "#{person} got a number: #{number}"
  end
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frog
puts number_of.jack

# --------- 写Ruby，可以时常想一想同样功能的Java代码要怎样写 ？ OO 要怎样写？
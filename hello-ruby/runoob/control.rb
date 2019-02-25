$i = 0
$num = 5

while $i < $num  do
  puts("在循环语句中 i = #$i" )
  $i +=1
end


begin
  puts("在循环语句中 i = #$i" )
  $i +=1;
end until $i > $num


def test
  yield 5
  puts "在 test 方法内"
  yield 100
end
test {|i| puts "你在块 #{i} 内"}
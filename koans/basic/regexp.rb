p "abc\n".gsub(/\z/, "!") #=> "abc\n!"
p "abc\n".gsub(/\Z/, "!") #=> "abc!\n!"

p1 = /http:\/\//

str = "http://www.ruby-lang.org/ja/"
%r|http://([^/]*)/| =~ str
print "server address: ", $1, "\n"



#----------------
str = '正则表达式真难啊，怎么这么难'
p str.gsub(/[^难]*(难).*/,replacement:'简单')


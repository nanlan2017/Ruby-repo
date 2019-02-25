def pref1(agr)
  agr.downcase!
end

a1 = 'HELLO'
p pref1(a1)
puts "#{a1}" #输出 hello

p "----------------- 行#{__LINE__ } ------------------->"
def pref2(agr)
  agr.downcase
end

a2 = 'PREF2'
p pref2(a2)
puts "#{a2}" #输出 PREF2
p "----------------- 行#{__LINE__ } ------------------->"
def pref3(a, b)
  a, b = b, a
end

a, b = 1, 2
p pref3(a, b)
puts a, b #输出 1,2
p "----------------- 行#{__LINE__ } ------------------->"
def pref4(agr)
  agr.replace('aaaaa')
end

a4 = 'a'
p pref4(a4)
puts a4 #输出 aaaaa
#====================================================================
class Dog
  def initialize(age=0,name="x")
    @age,@name = age,name
  end
  attr_accessor :age , :name
end

def mod_dog!(dog)
  p dog.object_id
  dog.age += 100
  dog.name = 'modified-'+dog.name
  p dog
end

def use_dog(dog)
  p dog.object_id
  new_dog = Dog.new
  new_dog.age = dog.age
  p new_dog.object_id
  new_dog
end

#⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵⤵
p "----------------- 行#{__LINE__ } ------------------->"
dog1 = Dog.new(1,"snoopy-1")
p dog1
p dog1.object_id
p "----------------- 行#{__LINE__ } ------------------->"
new_dog = use_dog(dog1)
p new_dog
p new_dog.object_id
p "----------------- 行#{__LINE__ } ------------------->"
modified_dog = mod_dog!(dog1)
p modified_dog
p modified_dog.object_id



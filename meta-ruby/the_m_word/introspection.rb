class Greeting

  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end

# test
greet = Greeting.new('hello,wangjiaheng')
p greet.welcome
p greet.class.instance_methods(false)
p greet.instance_variables

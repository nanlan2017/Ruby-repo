class Lawyer
  # 如果通过lawyer问你一些不理解的问题，就照这样做
  def method_missing(method,*args)
    puts "You just called :#{method}(#{args.join(', ')})"
    puts "You also passed it a block" if block_given?
  end
end

bob = Lawyer.new
bob.talk('a','b') {'c'}
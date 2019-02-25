# 一段 不在def定义 中的script，它的
#
# 我可以理解： 所有自定义的Class都是Object类的子类
#            所有自定义的Class都是Class类的instance
#
#

puts self.class   # 在顶层环境中，其实是在Object类中
puts self         # 顶层环境： Object的instance : main中
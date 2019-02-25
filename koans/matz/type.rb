# 所有的变量全部是弱类型的，那么如何表示  Home对象引用一个 Country 对象、持有一个Dog对象
# ▇▇▇▇▇▇▇▇▇▇▇ Java里的所有成员本就是按引用持有啊！！！  dup是浅拷贝，而 clone是深拷贝
class Home

  def initialize(country,dog)
    @dog,@country = dog,country
  end
end
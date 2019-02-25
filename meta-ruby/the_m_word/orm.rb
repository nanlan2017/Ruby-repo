class Entity

  def initialize(table,id)
    @table,@id = table,id
    Database.sql "INSERT INTO #{table}(id) VALUES (#{id})"
  end

  def set(col,val)
    Database.sql "UPDATE #{@table} SET #{col} = '#{val}' where id = #{@id}"
  end
end
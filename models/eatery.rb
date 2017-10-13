require_relative("../db/sql_runner.rb")

class Eatery

  attr_accessor :name
  attr_reader :id

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO eateries (name) VALUES ($1)
    RETURNING id;"
    values = [@name]
    eatery = SqlRunner.run(sql, values).first()
    @id = eatery['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM eateries;"
    values = []
    tables = SqlRunner.run(sql, values)
    results = tables.map {|table| Eatery.new(table)}
    return results
  end

  def self.find(id)
    sql = "SELECT * FROM eateries WHERE id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    return result
  end

  def update()
    sql = "UPDATE eateries SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM eateries;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM eateries WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end

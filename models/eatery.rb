require_relative("../db/sql_runner.rb")
require_relative("../models/burger.rb")
require_relative("../models/deal.rb")

class Eatery

  attr_accessor :name
  attr_reader :id

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name']
  end

# CRUD ACTIONS
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

  def self.delete(id)
    sql = "DELETE FROM eateries WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

# END OF CRUD ACTIONS

  def self.get_name(id)
    sql = "SELECT * FROM eateries WHERE id = $1;"
    values = [id]
    eatery = SqlRunner.run(sql, values).first()
    return eatery['name'].to_s
  end

  def self.find_burgers(id)
    sql = "SELECT * FROM burgers WHERE eatery_id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    burgers = results.map {|burger| Burger.new(burger)}
    return burgers
  end

  def self.find_from_burger(burger_id)
    sql = "SELECT * FROM burgers WHERE id = $1;"
    values = [burger_id]
    result = SqlRunner.run(sql, values).first()
    burger = Burger.new(result)
    sql = "SELECT * FROM eateries WHERE id = $1;"
    values = [burger.eatery_id]
    result = SqlRunner.run(sql, values).first()
    return result['id']
  end


end

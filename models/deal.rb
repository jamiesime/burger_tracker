require_relative("../db/sql_runner.rb")
require_relative("./burger.rb")

class Deal

  attr_accessor :name, :day, :eatery_id
  attr_reader :id

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name']
    @eatery_id = info['eatery_id']
  end

# CRUD ACTIONS

  def save()
    sql = "INSERT INTO deals (name, eatery_id)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@name, @eatery_id]
    deal = SqlRunner.run(sql, values).first()
    @id = deal['id'].to_i
  end

  def update()
    sql = "UPDATE burgers SET (name, eatery_id)
     = ($1, $2)
     WHERE id = $4"
    values = [@name, @eatery_id]
    SqlRunner.run(sql, values)
  end

  def self.find_all()
    sql = "SELECT * FROM deals"
    values = []
    results = SqlRunner.run(sql, values)
    deals = results.map {|result| Deal.new(result)}
    return deals
  end

  def self.find(id)
    sql = "SELECT * FROM deals WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM deals;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM deals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# end of CRUD actions



end

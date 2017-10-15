require_relative("../db/sql_runner.rb")
require_relative("./burger.rb")

class Deal

  attr_accessor :name, :day_id, :eatery_id, :burger_id
  attr_reader :id

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name']
    @day_id = info['day_id']
    @eatery_id = info['eatery_id']
    @burger_id = info['burger_id']
  end

# CRUD ACTIONS

  def save()
    sql = "INSERT INTO deals (name, day_id, eatery_id, burger_id)
    VALUES ($1, $2, $3, $4)
    RETURNING id;"
    values = [@name, @day_id, @eatery_id, @burger_id]
    deal = SqlRunner.run(sql, values).first()
    @id = deal['id'].to_i
  end

  def update()
    sql = "UPDATE burgers SET (name, day_id, eatery_id, burger_id)
     = ($1, $2, $3, $4)
     WHERE id = $5"
    values = [@name, @day_id, @eatery_id, @burger_id]
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

  def self.deal_details()
    sql = "SELECT deals.* FROM deals INNER JOIN burgers
    ON burgers.id = $1 INNER JOIN days ON days.id = $2"
    values = [@burger_id, @day_id]
    results = SqlRunner.run(sql, values)
    deals = results.map {|deal| Deal.new(deal)}
    return deals
  end

  def find_days()
    sql = "SELECT * FROM days WHERE id = $1"
    values = [@day_id]
    result = SqlRunner.run(sql, values).first()
    return result['name'].to_s
  end



end

require_relative("../db/sql_runner.rb")

class Day

  attr_reader :id, :name

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO days (name) VALUES ($1)
    RETURNING id;"
    values = [@name]
    day = SqlRunner.run(sql, values).first()
    @id = day['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM days;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM days WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    return result
  end

  def self.find_all()
    sql = "SELECT * FROM days;"
    values = []
    result = SqlRunner.run(sql, values)
    days = result.map {|day| Day.new(day)}
    return days
  end

  def self.get_name(id)
    sql = "SELECT * FROM days WHERE id = $1;"
    values = [id]
    day = SqlRunner.run(sql, values).first()
    return day['name'].to_s
  end

end

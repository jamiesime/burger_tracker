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

end

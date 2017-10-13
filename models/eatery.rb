


class Eatery

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO eateries (name) VALUES (S1)
    RETURNING id;"
    values = [@name]
    eatery = SqlRunner.run(sql, values).first()
  end

end



class Burger

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name']
    @price = info['price']
    @eatery_id = info['eatery_id']
  end

  def save()
    sql = "INSERT INTO burgers (name, price, eatery_id) VALUES
    ($1, $2, $3) RETURNING id;"
    values = [@name, @price, @eatery_id]
    burger = SqlRunner.run(sql, values).first()
    @id = burger['id'].to_i
  end

end

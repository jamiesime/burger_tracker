require_relative("../db/sql_runner.rb")

class Burger

  attr_accessor :name, :price, :eatery_id, :veg, :spice
  attr_reader :id

  def initialize(info)
    @id = info['id'] if ['id']
    @name = info['name']
    @price = info['price']
    @eatery_id = info['eatery_id']
    @veg = info['veg']
    @spice = info['spice']
  end

  def save()
    sql = "INSERT INTO burgers (name, price, eatery_id, veg, spice) VALUES
    ($1, $2, $3, $4, $5) RETURNING id;"
    values = [@name, @price, @eatery_id, @veg, @spice]
    burger = SqlRunner.run(sql, values).first()
    @id = burger['id'].to_i
  end

  def update()
    sql = "UPDATE burgers SET (name, price, eatery_id, veg, spice)
     = ($1, $2, $3, $4, $5)
     WHERE id = $6"
    values = [@name, @price, @eatery_id, @veg, @spice, @id]
    SqlRunner.run(sql, values)
  end

  def self.find_all()
    sql = "SELECT * FROM burgers"
    values = []
    tables = SqlRunner.run(sql, values)
    results = tables.map {|table| Burger.new(table)}
    return results
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM burgers WHERE name = $1"
    values = [name]
    burger = SqlRunner.run(sql, values).first()
    result = Burger.new(burger)
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM burgers WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM burgers;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM burgers WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  # end of CRUD

  def find_deal()
    sql = "SELECT * FROM deals WHERE burger_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    if result != nil
      return result['name'].to_s
    else
      return "No deal"
    end
  end

  def find_eateries()
    sql = "SELECT * FROM eateries WHERE id = $1;"
    values = [@eatery_id]
    result = SqlRunner.run(sql, values).first()
    if result != nil
      return result['name'].to_s
    else
      return "No eatery"
    end
  end

  def find_day()
    sql = "SELECT * FROM deals WHERE burger_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    if result != nil
      return result['day'].to_s
    else
      return 'N/A'
    end
  end

  def check_veg()
    if @veg == "true"
      return true
    else
      return false
    end
  end

  def check_spice()
    if @spice == "true"
      return true
    else
      return false
    end
  end


end

require_relative('../db/sql_runner.rb')
require_relative('burger.rb')
require_relative('deal.rb')
require_relative('day.rb')
require_relative('eatery.rb')

class ApplyDeal

  attr_accessor :day_id, :deal_id, :burger_id, :eatery_id
  attr_reader :id

  def initialize(info)
    @id = info['id'] if ['id']
    @burger_id = info['burger_id']
    @deal_id = info['deal_id']
    @day_id = info['day_id']
    @eatery_id = info['eatery_id']
  end

  def save()
    sql = "INSERT INTO applydeal (burger_id, deal_id, day_id, eatery_id) VALUES
    ($1, $2, $3, $4) RETURNING id;"
    values = [@burger_id, @deal_id, @day_id, @eatery_id]
    applydeal = SqlRunner.run(sql, values).first()
    @id = applydeal['id'].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM applydeal;"
    values = []
    result = SqlRunner.run(sql, values)
    apdeal = result.map {|deal| ApplyDeal.new(deal)}
    return apdeal
  end

  def self.delete(id)
    sql = "DELETE FROM applydeal WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end


  def fetch_burger()
    sql = "SELECT * FROM burgers WHERE id = $1;"
    values = [@burger_id]
    burger = SqlRunner.run(sql, values).first()
    return burger['name'].to_s
  end

  def fetch_deal()
    sql = "SELECT * FROM deals WHERE id = $1;"
    values = [@deal_id]
    deal = SqlRunner.run(sql, values).first()
    if deal != nil
      return deal['name'].to_s
    else
      return "No deal"
    end
  end

  def fetch_day()
    sql = "SELECT * FROM days WHERE id = $1;"
    values = [@day_id]
    day = SqlRunner.run(sql, values).first()
    return day['name'].to_s
  end

  def fetch_price()
    sql = "SELECT * FROM burgers WHERE id = $1;"
    values = [@burger_id]
    price = SqlRunner.run(sql, values).first()
    return price['price'].to_i
  end

  def fetch_eatery()
    sql = "SELECT * FROM eateries WHERE id = $1;"
    values = [@eatery_id]
    eatery = SqlRunner.run(sql, values).first()
    return eatery['name'].to_s
  end

  def get_discount(price)
    price.to_f
    sql = "SELECT * FROM deals WHERE id = $1"
    values = [@deal_id]
    deal = SqlRunner.run(sql, values).first()
    dealtype = deal["deal_type"].to_s
    case (dealtype)
    when "halfprice"
        newprice = (price.to_f / 2)
        return newprice.to_f
      end
      return "Not found!"
  end





end

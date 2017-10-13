require 'minitest/autorun'
require_relative '../models/burger.rb'


class BurgerTest < MiniTest::Test

  def setup()
    @burger = Burger.new({
      'name' => 'Big Kahuna',
      'price' => 5,
      'eatery_id' => eatery1.id
      })
    burger1.save()
  end

  def test_save()
    
  end

end

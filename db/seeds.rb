require_relative("../models/burger.rb")

burger1 = Burger.new({
  'name' => 'Big Kahuna',
  'price' => 5,
  'eatery_id' => eatery1.id
  })
burger1.save()

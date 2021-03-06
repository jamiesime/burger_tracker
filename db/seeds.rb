require_relative("../models/burger.rb")
require_relative("../models/eatery.rb")
require_relative("../models/deal.rb")
require_relative("../models/day.rb")
require_relative("../models/apply_deal.rb")
require("pry-byebug")

Deal.delete_all()
Burger.delete_all()
Eatery.delete_all()
Day.delete_all()

day1 = Day.new({'name' => 'Monday'})
day2 = Day.new({'name' => 'Tuesday'})
day3 = Day.new({'name' => 'Wednesday'})
day4 = Day.new({'name' => 'Thursday'})
day5 = Day.new({'name' => 'Friday'})
day6 = Day.new({'name' => 'Saturday'})
day7 = Day.new({'name' => 'Sunday'})
day1.save()
day2.save()
day3.save()
day4.save()
day5.save()
day6.save()
day7.save()

eatery1 = Eatery.new({
  'name' => 'Stacked'
  })
eatery1.save()

burger1 = Burger.new({
  'name' => 'Big Kahuna',
  'price' => 5,
  'eatery_id' => eatery1.id,
  'veg' => false,
  'spice' => true
  })
burger1.save()

burger2 = Burger.new({
  'name' => 'Cheese Supreme',
  'price' => 6,
  'eatery_id' => eatery1.id,
  'veg' => true,
  'spice' => true
  })
burger2.save()

deal1 = Deal.new({
  'name' => 'Half Price',
  'eatery_id' => eatery1.id,
  'day' => 'Wednesday',
  'deal_type' => 'halfprice'
  })
deal1.save()

applydeal1 = ApplyDeal.new({
  'burger_id' => burger1.id,
  'deal_id' => deal1.id,
  'day_id' => day3.id,
  'eatery_id' => eatery1.id
  })
applydeal1.save()

binding.pry
nil

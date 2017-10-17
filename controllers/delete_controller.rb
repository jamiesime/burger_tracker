require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/deal.rb')
require_relative ('../models/burger.rb')
require_relative ('../models/eatery.rb')
require_relative ('../models/day.rb')


post '/del_burger' do
  Burger.delete(params["burger_id"])
  erb ( :"edit/deleted" )
end

post '/del_eatery' do
  Eatery.delete(params["eatery_id"])
  erb ( :"edit/deleted" )
end

post '/del_deal' do
  Deal.delete(params["deal_id"])
  erb ( :"edit/deleted" )
end

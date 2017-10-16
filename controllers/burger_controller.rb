require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/deal.rb')
require_relative ('../models/burger.rb')
require_relative ('../models/eatery.rb')

get '/add_burger' do
  @eateries = Eatery.find_all()
  erb ( :add_burger )
end

post '/burger_conf' do
  burger = Burger.new(params)
  burger.save()
  erb ( :burger_conf )
end

require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/deal.rb')
require_relative ('../models/burger.rb')
require_relative ('../models/eatery.rb')

get '/add_eatery' do
  erb ( :add_eatery )
end

post '/eatery_conf' do
  eatery = Eatery.new(params)
  eatery.save()
  erb ( :eatery_conf )
end

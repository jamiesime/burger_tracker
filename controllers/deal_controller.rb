require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/deal.rb')
require_relative ('../models/burger.rb')
require_relative ('../models/eatery.rb')

get '/add_deal' do
  @eateries = Eatery.find_all()
  @burgers = Burger.find_all()
  @days = Day.find_all()
  erb ( :"edit/add_deal" )
end

post '/deal_conf' do
  deal = Deal.new(params)
  deal.save()
  erb ( :"edit/deal_conf" )
end

get '/link_deal' do
  @eateries = Eatery.find_all()
  @burgers = Burger.find_all()
  @days = Day.find_all()
  @deals = Deal.find_all()
  erb ( :"edit/link_deal" )
end

post '/link_conf' do
  newlink = ApplyDeal.new(params)
  newid = Eatery.find_from_burger(params['burger_id'])
  newlink.eatery_id = newid
  newlink.save()
  erb ( :"edit/link_conf" )
end

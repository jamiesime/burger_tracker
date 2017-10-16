require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/deal.rb')
require_relative ('../models/burger.rb')
require_relative ('../models/eatery.rb')

get '/add_deal' do
  @eateries = Eatery.find_all()
  @burgers = Burger.find_all()
  @days = Day.find_all()
  erb ( :add_deal )
end

post '/deal_conf' do
  deal = Deal.new(params)
  deal.save()
  linkdeal = ApplyDeal.new(params)
  linkdeal.deal_id = deal.id
  linkdeal.save()
  erb ( :deal_conf )
end

get '/link_deal' do
  @eateries = Eatery.find_all()
  @burgers = Burger.find_all()
  @days = Day.find_all()
  @deals = Deal.find_all()
  erb ( :link_deal )
end

post '/link_conf' do
  newlink = ApplyDeal.new(params)
  newlink.save()
  erb ( :link_conf )
end

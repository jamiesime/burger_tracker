require ('sinatra')
require ('sinatra/contrib/all')
require ('date')
require_relative ('./models/deal.rb')
require_relative ('./models/burger.rb')
require_relative ('./models/eatery.rb')
require_relative ('./models/day.rb')
require_relative ('./models/apply_deal.rb')
require_relative('controllers/burger_controller.rb')
require_relative('controllers/eatery_controller.rb')
require_relative('controllers/deal_controller.rb')
require_relative('controllers/delete_controller.rb')

get '/' do
  @day = Date.today.strftime("%A")
  @date = Date.today.strftime("%A, %d-%m-%Y")
  erb ( :home )
end

get '/edit' do
  @burgers = Burger.find_all()
  @eateries = Eatery.find_all()
  @deals = Deal.find_all()
  @links = ApplyDeal.find_all()
  erb ( :edit )
end

get '/search' do
  @burgers = Burger.find_all()
  @eateries = Eatery.find_all()
  @deals = Deal.find_all()
  @days = Day.find_all()
  erb ( :"view/search" )
end

get '/list' do
  @matches = ApplyDeal.find_all()
  @burgers = Burger.find_all()
  @deal = Deal.find_all()
  erb ( :"view/list" )
end

post '/deal_by_day' do
  @day = Day.get_name(params["day"].to_i)
  @deals = Deal.find_all()
  @matches = ApplyDeal.find_all()
  erb ( :"view/deal_by_day" )
end

post '/deal_by_eatery' do
  @eatery = Eatery.get_name(params["eatery"].to_i)
  @nodeals = Eatery.find_burgers(params["eatery"].to_i)
  @matches = ApplyDeal.find_all()
  erb ( :"view/deal_by_eatery" )
end

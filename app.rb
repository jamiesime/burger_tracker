require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('./models/deal.rb')
require_relative ('./models/burger.rb')
require_relative ('./models/day.rb')
require_relative ('./models/eatery.rb')


get '/' do
  erb ( :home )
end

get '/add' do
  @deals = Deal.find_all()
  @days = Day.find_all()
  @eateries = Eatery.find_all()
  erb ( :add )
end

post '/result' do
  burger = Burger.new(params)
  burger.save()
  erb ( :result )
end

get '/search' do
  @burgers = Burger.find_all()
  @eateries = Eatery.find_all()
  erb ( :search )
end

get '/list' do
  @burgers = Burger.find_all()
  @eateries = Eatery.find_all()
  @days = Day.find_all()
  @results = Deal.find_all()
  erb ( :list )
end

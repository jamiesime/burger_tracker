require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('./models/deal.rb')


get '/' do
  erb ( :home )
end

get '/add' do
  @deals = Deal.find_all()
  erb (:add)
end

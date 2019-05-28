require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('models/pizza_order.rb')
also_reload('models/*')


# INDEX see all orders
get '/pizza-orders' do
  @orders = PizzaOrder.all
  erb( :index )
end

# NEW pizza orders form
get '/pizza-orders/new' do
  erb( :new )
end

# SHOW one order
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb( :show )
end

#CREATE new database entry
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save
  erb( :create )
end

# EDIT relevant entry
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb( :edit )
end

#UPDATE database

post '/pizza-orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update
  redirect '/pizza-orders'
end
# DELETE entry

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete
  redirect '/pizza-orders'
end

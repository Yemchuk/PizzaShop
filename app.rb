#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :address, presence: true
end


get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

before do
	@order = Order.new
end

post '/cart' do
	@orders_input = params[:orders]
	@items = parse_orders_input @orders_input

	@items.each do |item|
		item[0] = Product.find(item[0])
	end
  erb :cart
end

def parse_orders_input orders_input
	s1 = orders_input.split(/,/)
	arr = []
	s1.each do |x|
		s2 = x.split(/\=/)
		s3 = s2[0].split(/_/)
		id = s3[1]
		cnt = s2[1]
		arr2 = [id, cnt]
		arr.push arr2
	end
	return arr
end

post '/place_order' do
	@o = Order.create params[:order]
	if @o.save
		erb "Thank you! Yout order has been placed!"
	else
		@error = @o.errors.full_messages.first
		erb "Error"
	end
end

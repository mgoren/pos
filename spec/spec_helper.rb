ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('pry')
require("sinatra/activerecord")
require('./lib/product')
require('./lib/purchase')

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end
    Purchase.all().each() do |purchase|
      purchase.destroy()
    end
  end
end

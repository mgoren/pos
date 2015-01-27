require("sinatra")
require("sinatra/reloader")
require("pg")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/product")
require('pry')

get("/") do
  erb(:index)
end

get("/manager/products") do
  erb(:manager_products)
end

get("/manager/products/:id/edit") do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product_edit)
end

patch("/manager/products/:id") do
  product = Product.find(params.fetch("id").to_i())
  new_name = params["new_name"]
  new_price = params["new_price"].to_f()

  if new_name == ""
    new_name = product.name()
  end
  if new_price <= 0.0
    new_price = product.price()
  end  
  product.update({ :name => new_name, :price => new_price })
  redirect("/manager/products")
end

post("/manager/products") do
  product_name = params.fetch("product_name")
  price = params.fetch("price").to_f()
  @product = Product.new({ :name => product_name, :price => price })
  if @product.save()
    redirect("/manager/products")
  else
    erb(:errors)
  end
end






# post("/new_purchase") do
#   purchase = Purchase.create()
#   @purchase_id = purchase.id().to_i()
#   erb(:products)
# end
#
# post("/products") do
#   erb(:products)
# end

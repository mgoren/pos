require("sinatra")
require("sinatra/reloader")
require("pg")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/product")

get("/") do
  erb(:index)
end

get("/manager/products") do
    erb(:manager_products)
end

post("/manager/products") do
  product_name = params.fetch("product_name")
  price = params.fetch("price")
  Product.create({ :name => product_name, :price => price })
  redirect("/manager/products")
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

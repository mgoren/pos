require('spec_helper')

describe(Product) do

  it("validates presence of price") do
    product = Product.new({ :name => "crud" })
    expect(product.save()).to(eq(false))
  end

  it("validates presence of name") do
    product = Product.new({ :price => 5000.99 })
    expect(product.save()).to(eq(false))
  end

  it("validates that the price is a float") do
    product = Product.new({ :name => "crud", :price => "price" })
    expect(product.save()).to eq(false)
  end

end

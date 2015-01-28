require('spec_helper')

describe(Purchase) do

  describe("#total") do
    it("sum the product prices") do
      test_product = Product.create({ :name => "stuff", :price => 4 })
      test_product2 = Product.create({ :name => "things", :price => 2 })
      purchase = Purchase.create()
      purchase.add_products([test_product.id().to_s, test_product2.id().to_s])
      expect(purchase.total()).to eq(6)
    end
  end

  describe(".between") do
    it("return purchases made between given dates") do
      test_purchase = Purchase.create()
      test_purchase2 = Purchase.create()
      expect(Purchase.between("2015-01-26", "2015-01-29" )).to eq([test_purchase, test_purchase2])
    end
  end


end

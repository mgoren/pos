class Purchase < ActiveRecord::Base
  has_and_belongs_to_many :products

  scope(:between, lambda do |start_date, end_date|
    where("created_at >= :start_date AND created_at <= :end_date",
    { :start_date => start_date, :end_date => end_date })
  end)

  define_method(:total) do
    self.products.sum(:price)
  end

  define_method(:add_products) do |product_ids|
    product_ids.each() do |product_id|
      self.products << Product.find(product_id.to_i())
    end
  end



end

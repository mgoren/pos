class CreateProductsAndPurchases < ActiveRecord::Migration
  def change

    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:price, :float)

      t.timestamps
    end

    create_table(:purchases) do |t|
      t.column(:account, :string)
      t.column(:invoice_num, :integer)

      t.timestamps
    end

    create_table(:products_purchases) do |t|
      t.column(:product_id, :integer)
      t.column(:purchase_id, :integer)      
    end

  end
end

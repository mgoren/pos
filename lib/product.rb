class Product < ActiveRecord::Base
  has_and_belongs_to_many :purchases
  validates :name, { :presence => true }
  validates :price, { :presence => true, :numericality => { :greater_than => 0.0 } }




end

class Product < ActiveRecord::Base
  has_and_belongs_to_many :purchases
  validates_presence_of :name, :price
  validates :price, numericality: {greater_than: 0.0}





end

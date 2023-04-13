class Product < ApplicationRecord
    belongs_to :restaurant, class_name: 'Restaurant', foreign_key: 'restaurant_id'
    has_many :product_orders, class_name: 'ProductOrder', foreign_key: 'product_id'
    validates :restaurant_id, :name, :cost, presence:true
    validates :cost, numericality: { greater_than_or_equal_to: 0 }
end

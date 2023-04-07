class Product < ApplicationRecord
    belongs_to :restaurant, class_name: 'Restaurant', foreign_key: 'restaurant_id'
    has_many :product_orders, class_name: 'ProductOrder', foreign_key: 'product_id'
end

class Order < ApplicationRecord
    belongs_to :restaurant, class_name: 'Restaurant', foreign_key: 'restaurant_id'
    belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
    belongs_to :orderstatus, class_name: 'OrderStatus', foreign_key: 'orderstatus_id'
    has_many :product_orders, class_name: 'ProductOrder', foreign_key: 'order_id'
end

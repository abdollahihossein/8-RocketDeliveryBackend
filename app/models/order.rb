class Order < ApplicationRecord
    belongs_to :restaurant, class_name: 'Restaurant', foreign_key: 'restaurant_id'
    belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
    belongs_to :order_status, class_name: 'OrderStatus', foreign_key: 'order_status_id'
    belongs_to :courier, class_name: 'Courier', foreign_key: 'courier_id', optional: true
    has_many :product_orders, class_name: 'ProductOrder', foreign_key: 'order_id'
    validates :restaurant_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_nil: true
    validates :restaurant_id, :customer_id, :order_status_id, presence:true
end

class OrderStatus < ApplicationRecord
    has_many :orders, class_name: 'Order', foreign_key: 'order_status_id'
end

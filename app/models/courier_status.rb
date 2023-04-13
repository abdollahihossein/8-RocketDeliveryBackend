class CourierStatus < ApplicationRecord
    has_many :couriers, class_name: 'Courier', foreign_key: 'courier_status_id'
    validates :name, presence:true
end

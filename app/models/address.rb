class Address < ApplicationRecord
    has_many :employees, class_name: 'Employee', foreign_key: 'address_id'
    has_one :restaurant, class_name: 'Restaurant', foreign_key: 'address_id'
    has_many :customers, class_name: 'Customer', foreign_key: 'address_id'
    has_many :couriers, class_name: 'Courier', foreign_key: 'address_id'
end

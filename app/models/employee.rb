class Employee < ApplicationRecord
    belongs_to :address, class_name: 'Address', foreign_key: 'address_id'
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    validates :user_id, :address_id, :phone, presence:true
    validates_uniqueness_of :user_id
end

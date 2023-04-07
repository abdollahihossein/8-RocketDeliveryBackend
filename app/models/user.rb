class User < ApplicationRecord
  has_one :employee, class_name: 'Employee', foreign_key: 'user_id'
  has_many :restaurants, class_name: 'Restaurant', foreign_key: 'user_id'
  has_one :customer, class_name: 'Customer', foreign_key: 'user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

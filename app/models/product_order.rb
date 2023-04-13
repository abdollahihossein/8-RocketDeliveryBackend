class ProductOrder < ApplicationRecord
    belongs_to :product, class_name: 'Product', foreign_key: 'product_id'
    belongs_to :order, class_name: 'Order', foreign_key: 'order_id'
    validates :product_id, :order_id, :product_quantity, :product_unit_cost, presence:true
    validates :product_quantity, numericality: { greater_than_or_equal_to: 1 }
    validates :product_unit_cost, numericality: { greater_than_or_equal_to: 0 }
    validates_uniqueness_of :product_id, scope: %i[order_id]
    validate :restaurant_is_the_same
  
    def restaurant_is_the_same
      if product.respond_to?(:restaurant) && order.respond_to?(:restaurant) && product.restaurant_id != order.restaurant_id
        errors.add(:product, "must belong to the same restaurant as the order")
      end
    end
    
end

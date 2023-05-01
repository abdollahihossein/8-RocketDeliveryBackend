class Api::OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def update
        status = params[:status]
        id = params[:id]
        @order = Order.find_by(id: id)
        order_status = OrderStatus.find_by(name: status)

        if order_status && @order
            @order.update(order_status_id: order_status.id)
            render json: {success: true}, status: 200
        else
            render json: { error: "Invalid status or Invalid order" }, status: 422
        end
    end

    def index
        usertype = params[:user_type]
        id = params[:user_id]

        if !usertype || !id
            render json: { error: "Both 'user type' and 'id' parameters are required" }, status: 400
            return
        end

        j = 0
        result = []

        if usertype == "customer"
            customer = Customer.find_by(id: id)
            if customer
                user1 = customer.user
                address1 = customer.address
                orders = customer.orders
                orders.each do |order|
                    restaurant = order.restaurant
                    address2 = restaurant.address
                    courier = order.courier
                    user2 = courier.user
                    order_status = order.order_status
                    product_orders = order.product_orders
                    k = 0
                    result2 = []
                    total_cost = 0
                    product_orders.each do |product_order|
                        products = product_order.product
                        result2[k] = {
                            "product_id": product_order.product_id,
                            "product_name": products.name,
                            "quantity": product_order.product_quantity,
                            "unit_cost": products.cost.to_f/100,
                            "total_cost": product_order.product_quantity * products.cost.to_f/100
                        }
                        total_cost +=  product_order.product_quantity * products.cost.to_f/100
                        k += 1
                    end

                result[j] = {
                    "id": order.id,
                    "customer_id": customer.id,
                    "customer_name": user1.name,
                    "customer_address": "#{address1.street_address}, #{address1.city}, #{address1.postal_code}",
                    "restaurant_id": restaurant.id,
                    "restaurant_name": restaurant.name,
                    "restaurant_address": "#{address2.street_address}, #{address2.city}, #{address2.postal_code}",
                    "courier_id": courier.id,
                    "courier_name": user2.name,
                    "status": order_status.name,
                    "products": result2,
                    "total_cost": total_cost.round(2)
                }
                j += 1
                end
            end
        elsif usertype == "restaurant"
            restaurant = Restaurant.find_by(id: id)
            if restaurant
                address2 = restaurant.address
                orders = restaurant.orders
                orders.each do |order|
                    customer = order.customer
                    user1 = customer.user
                    address1 = customer.address
                    courier = order.courier
                    user2 = courier.user
                    order_status = order.order_status
                    product_orders = order.product_orders
                    k = 0
                    result2 = []
                    total_cost = 0
                    product_orders.each do |product_order|
                        products = product_order.product
                        result2[k] = {
                            "product_id": product_order.product_id,
                            "product_name": products.name,
                            "quantity": product_order.product_quantity,
                            "unit_cost": products.cost.to_f/100,
                            "total_cost": product_order.product_quantity * products.cost.to_f/100
                        }
                        total_cost +=  product_order.product_quantity * products.cost.to_f/100
                        k += 1
                    end

                result[j] = {
                    "id": order.id,
                    "customer_id": customer.id,
                    "customer_name": user1.name,
                    "customer_address": "#{address1.street_address}, #{address1.city}, #{address1.postal_code}",
                    "restaurant_id": restaurant.id,
                    "restaurant_name": restaurant.name,
                    "restaurant_address": "#{address2.street_address}, #{address2.city}, #{address2.postal_code}",
                    "courier_id": courier.id,
                    "courier_name": user2.name,
                    "status": order_status.name,
                    "products": result2,
                    "total_cost": total_cost.round(2)
                }
                j += 1
                end
            end
        elsif usertype == "courier"
            courier = Courier.find_by(id: id)
            if courier
                user2 = courier.user
                orders = courier.orders
                orders.each do |order|
                    customer = order.customer
                    user1 = customer.user
                    address1 = customer.address
                    restaurant = order.restaurant
                    address2 = restaurant.address
                    order_status = order.order_status
                    product_orders = order.product_orders
                    k = 0
                    result2 = []
                    total_cost = 0
                    product_orders.each do |product_order|
                        products = product_order.product
                        result2[k] = {
                            "product_id": product_order.product_id,
                            "product_name": products.name,
                            "quantity": product_order.product_quantity,
                            "unit_cost": products.cost.to_f/100,
                            "total_cost": product_order.product_quantity * products.cost.to_f/100
                        }
                        total_cost +=  product_order.product_quantity * products.cost.to_f/100
                        k += 1
                    end

                result[j] = {
                    "id": order.id,
                    "customer_id": customer.id,
                    "customer_name": user1.name,
                    "customer_address": "#{address1.street_address}, #{address1.city}, #{address1.postal_code}",
                    "customer_street_address": "#{address1.street_address}",
                    "restaurant_id": restaurant.id,
                    "restaurant_name": restaurant.name,
                    "restaurant_address": "#{address2.street_address}, #{address2.city}, #{address2.postal_code}",
                    "courier_id": courier.id,
                    "courier_name": user2.name,
                    "status": order_status.name,
                    "products": result2,
                    "total_cost": total_cost.round(2)
                }
                j += 1
                end
            end
        else
            render json: { error: "Invalid user type" }, status: 422
            return
        end
        render json: result, status: 200
    end

    def create

    end
end

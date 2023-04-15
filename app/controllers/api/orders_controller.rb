class Api::OrdersController < ApplicationController
    def index
        status = params[:status]
        id = params[:id]
        @order = Order.find_by(id)
        order_status = OrderStatus.find_by(name: status)

        if order_status && @order
            @order.update(order_status_id: order_status.id)
            render json: {success: true}, status: 200
        else
            render json: { error: "Invalid status or Invalid order" }, status: 422
        end
    end
end

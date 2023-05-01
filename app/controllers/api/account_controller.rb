class Api::AccountController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        user_type = params[:type]
        id = params[:id]
        if user_type == 'customer'
            customer = Customer.find_by(id: id)
            if customer
                render json: customer, status: :ok
            else
                render json: { error: "No customer found!" }, status: 422
            end
        elsif user_type == 'courier'
            courier = Courier.find_by(id: id)
            if courier
                render json: courier, status: :ok
            else
                render json: { error: "No courier found!" }, status: 422
            end
        end
    end

    def update
        user_type = params[:type]
        id = params[:id]
        email = params[:email]
        phone = params[:phone]
        if user_type == 'customer'
            customer = Customer.find_by(id: id)
            if customer
                customer.update(email: email, phone: phone)
                render json: {success: true}, status: :ok
            else
                render json: { error: "No customer found!" }, status: 422
            end
        elsif
            user_type == 'courier'
            courier = Courier.find_by(id: id)
            if courier
                courier.update(email: email, phone: phone)
                render json: {success: true}, status: :ok
            else
                render json: { error: "No courier found!" }, status: 422
            end
        end
    end
end

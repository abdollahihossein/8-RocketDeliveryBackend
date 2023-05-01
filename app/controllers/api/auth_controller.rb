class Api::AuthController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @user = User.find_by(email: params[:email])
        if @user && @user.valid_password?(params[:password])
            render json: {
                success: true,
                customer_id: @user.customer ? @user.customer.id : "nil",
                user_id: @user.id,
                courier_id: @user.courier ? @user.courier.id : "nil"
            }, status: :ok
        else
            render json: {success: false}, status: :unauthorized
        end
    end
end

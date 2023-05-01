class Api::ProductsController < ApplicationController
    def index
        id = params[:restaurant]
        if id != nil
            restaurant = Restaurant.find_by(id: id)
            if restaurant
                products = restaurant.products.select(:id, :name, :cost)
            end
            if products
                render json: products, status: :ok
            else
                render json: { error: "Invalid restaurant ID" }, status: 422
            end
        else
            @products = Product.all
            if @products
                render json: { message: "Products exist!"}, status: :ok
            end
        end
    end
end

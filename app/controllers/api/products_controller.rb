class Api::ProductsController < ApplicationController
    def index

        data = params[:restaurant]
        
        if data != nil
            restaurant = Restaurant.find_by(data)
            if restaurant
                @products = restaurant.products.select(:id, :name, :cost)
            end
            if @products
                j = 0
                result = []
                @products.each do |product|
                    result[j] = {id: product.id, name: product.name, cost: product.cost}
                    j += 1
                end            
                render json: result, status: :ok
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


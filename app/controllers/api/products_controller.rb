class Api::ProductsController < ApplicationController
    def index
        
        # @products = Product.all
        # if @products
        #     render json: {status: 'SUCCESS', message: 'Products exist', data: @products}, status: :ok
        # else
        #     render json: {status: 'ERROR', message: 'No product!'}, status: :unprocessable_entity
        # end
        
        # restaurant_id = params[:restaurant]
        # restaurant = Restaurant.find_by(id: restaurant_id)
        @products = Product.find_by(restaurant: params[:restaurant])
        if @products
            j = 0
            result = []
            @products.each do |product|
                puts product.name
                result[j] = {id: product.id, name: product.name, cost: product.cost}
                j += 1
            end

            render json: {status: 'SUCCESS', message: 'Products exist', data: result}, status: :ok
            # render json: data, status: :ok
        else
            render json: {status: 'ERROR', message: 'No product!'}, status: :unprocessable_entity
        end

        # j = 0
        # data = []
        # [1,2,3,4,5].each do |product|
        #     puts j
        #     data[j] = {id: j, name: j+1, cost: j+2}
        #     j += 1
        # end

        # print data
        
    end
end


# assert_equal [{id: product1.id, name: product1.name, cost: product1.cost},
#                   {id: product2.id, name: product2.name, cost: product2.cost}].to_json, response.body
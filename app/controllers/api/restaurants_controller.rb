class Api::RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
        price_range = params[:price_range]
        rating = params[:rating]
        @restaurant = Restaurant.find_by(price_range: price_range)
        @order = Order.find_by(restaurant_rating: rating)
        range1 = 1..5
        range2 = 1..3

        if rating != nil || price_range != nil
            if @restaurants && @restaurant && range1.cover?(rating.to_i) && range2.cover?(price_range.to_i)
                result = [{
                    id: @restaurant.id,
                    name: @restaurant.name,
                    price_range: @restaurant.price_range,
                    rating: @order.restaurant_rating
                }]
                render json: result, status: :ok
            elsif !range1.cover?(rating.to_i) || !range2.cover?(price_range.to_i)
                render json: { error: "Invalid rating or price range" }, status: 422
            end
        else
            if @restaurants
                render json: { message: "Restaurants exist!"}, status: :ok
            end
        end

    end
end

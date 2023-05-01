class Api::RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
        price_range = params[:price_range]
        rating = params[:rating]
        @restaurant = Restaurant.find_by(price_range: price_range)
        @order = Order.find_by(restaurant_rating: rating)
        # puts Restaurant.select(:id, :name).to_json
        # puts Restaurant.count
        # puts Restaurant.select(:id, :name).to_json
        range1 = 1..5
        range2 = 1..3
        if rating != nil || price_range != nil
            if @restaurants && @restaurant && range1.cover?(rating.to_i) && range2.cover?(price_range.to_i)
                result = Restaurant.joins(:orders).select(:id, :name, :price_range, 'restaurant_rating as rating')
                # result = [{
                #     id: @restaurant.id,
                #     name: @restaurant.name,
                #     price_range: @restaurant.price_range,
                #     rating: @order.restaurant_rating
                # }]
                render json: result, status: :ok
            elsif !range1.cover?(rating.to_i) || !range2.cover?(price_range.to_i)
                render json: { error: "Invalid rating or price range" }, status: 422
            end
        else
            if @restaurants
                restaurants = Restaurant.select(:id, :name, :price_range)
                averageRating=[]
                restaurants.each do |restaurant|
                    orders = restaurant.orders
                    sum = 0
                    k = 0
                    orders.each do |order|
                        if order.restaurant_rating
                            sum += order.restaurant_rating.to_f
                            k += 1
                        end
                    end
                    averageRating.push(rating: (sum/k).round)
                end
                results = restaurants.as_json.zip(averageRating)
                final=[]
                results.each do |result|
                    final.push(result.reduce({}, :merge))
                end
                render json: final, status: :ok
            end
        end
    end
end

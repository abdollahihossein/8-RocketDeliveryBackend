require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest

  def setup
    user = User.create!(name: "User 1", email: "test@test.com", password: "password")
    address = Address.create!(street_address: "Street 1", city: "City 1", postal_code: "11111")
    restaurant = Restaurant.create!(id: 2, user: user, address: address, name: "Restaurant 1", phone: "123456", price_range: 2)
    customer = Customer.create!(user: user, address: address, phone: "123456")
    product = Product.create!(name: "Product 1", cost: 10, restaurant: restaurant)
    order_status = OrderStatus.create(name: "pending")
    OrderStatus.create(name: "in progress")
    OrderStatus.create(name: "delivered")
    @order = Order.create!(restaurant: restaurant, customer: customer, order_status: order_status, restaurant_rating: 4)
    
    # Data for new tests:
    user1 = User.create!(name: "Cathy Spinka", email: "cathy@test.com", password: "password")
    address1 = Address.create!(street_address: "7757 Darwin Causeway", city: "Gerlachfort", postal_code: "19822")
    @employee = Employee.create!(user: user1, address: address1, phone: "5385759", email: "employee@test.com")
    @customer1 = Customer.create!(id: 5, user: user1, address: address1, phone: "1234569")
    user2 = User.create!(name: "John Dou", email: "John@test.com", password: "password")
    address2 = Address.create!(street_address: "5398 Quigley Harbor", city: "North Lynelle", postal_code: "60808")
    @restaurant1 = Restaurant.create!(id: 1, user: user2, address: address2, name: "Fast Pub", phone: "1234567", price_range: 2)
    user3 = User.create!(name: "Cathy Spinka", email: "cathy2@test.com", password: "password")
    address3 = Address.create!(street_address: "7758 Darwin Causeway", city: "Gerlachforts", postal_code: "19823")
    courier_status = CourierStatus.create!(name: "free")
    @courier1 = Courier.create!(id: 3, user: user3, address: address3, courier_status: courier_status, phone: "12345678")
    order_status1 = OrderStatus.create!(name: "in progress")
    order1 = Order.create!(id: 3, restaurant: @restaurant1, customer: @customer1, courier: @courier1, order_status: order_status1)
    product1 = Product.create!(id: 2, restaurant: @restaurant1, name: "Vegetable Soup", cost: 1975)
    product_order1 = ProductOrder.create!(product: product1, order: order1, product_quantity: 2, product_unit_cost: product1.cost)
    product2 = Product.create!(id: 4, restaurant: @restaurant1, name: "Peking Duck", cost: 175)
    product_order2 = ProductOrder.create!(product: product2, order: order1, product_quantity: 1, product_unit_cost: product2.cost)
    product3 = Product.create!(id: 6, restaurant: @restaurant1, name: "Pasta Carbonara", cost: 925)
    product_order3 = ProductOrder.create!(product: product3, order: order1, product_quantity: 2, product_unit_cost: product3.cost)

    user4 = User.create!(name: "Jane Dou", email: "Jane@test.com", password: "password")
    address4 = Address.create!(street_address: "5515 Sol Inlet", city: "Shelbyfurt", postal_code: "49433-4387")
    @restaurant2 = Restaurant.create!(id: 4, user: user4, address: address4, name: "Silver Grill", phone: "12345", price_range: 3)
    user5 = User.create!(name: "Rev. Lavina Cartwright", email: "lavina@test.com", password: "password")
    address5 = Address.create!(street_address: "7759 Darwin Causeway", city: "Gerlachfortsz", postal_code: "19824")
    @courier2 = Courier.create!(id: 5, user: user5, address: address5, courier_status: courier_status, phone: "12345678")
    order_status2 = OrderStatus.create!(name: "delivered")
    order2 = Order.create!(id: 13, restaurant: @restaurant2, customer: @customer1, courier: @courier2, order_status: order_status2)
    product4 = Product.create!(id: 22, restaurant: @restaurant2, name: "Pappardelle alla Bolognese", cost: 1274)
    product_order4 = ProductOrder.create!(product: product4, order: order2, product_quantity: 1, product_unit_cost: product4.cost)
    product5 = Product.create!(id: 20, restaurant: @restaurant2, name: "French Fries with Sausages", cost: 1624)
    product_order5 = ProductOrder.create!(product: product5, order: order2, product_quantity: 1, product_unit_cost: product5.cost)
    @orders_list1 = [
      {
          "id": 3,
          "customer_id": 5,
          "customer_name": "Cathy Spinka",
          "customer_address": "7757 Darwin Causeway, Gerlachfort, 19822",
          "restaurant_id": 1,
          "restaurant_name": "Fast Pub",
          "restaurant_address": "5398 Quigley Harbor, North Lynelle, 60808",
          "courier_id": 3,
          "courier_name": "Cathy Spinka",
          "status": "in progress",
          "products": [
              {
                  "product_id": 2,
                  "product_name": "Vegetable Soup",
                  "quantity": 2,
                  "unit_cost": 1975,
                  "total_cost": 3950
              },
              {
                  "product_id": 4,
                  "product_name": "Peking Duck",
                  "quantity": 1,
                  "unit_cost": 175,
                  "total_cost": 175
              },
              {
                  "product_id": 6,
                  "product_name": "Pasta Carbonara",
                  "quantity": 2,
                  "unit_cost": 925,
                  "total_cost": 1850
              }
          ],
          "total_cost": 5975
      },
      {
          "id": 13,
          "customer_id": 5,
          "customer_name": "Cathy Spinka",
          "customer_address": "7757 Darwin Causeway, Gerlachfort, 19822",
          "restaurant_id": 4,
          "restaurant_name": "Silver Grill",
          "restaurant_address": "5515 Sol Inlet, Shelbyfurt, 49433-4387",
          "courier_id": 5,
          "courier_name": "Rev. Lavina Cartwright",
          "status": "delivered",
          "products": [
              {
                  "product_id": 22,
                  "product_name": "Pappardelle alla Bolognese",
                  "quantity": 1,
                  "unit_cost": 1274,
                  "total_cost": 1274
              },
              {
                  "product_id": 20,
                  "product_name": "French Fries with Sausages",
                  "quantity": 1,
                  "unit_cost": 1624,
                  "total_cost": 1624
              }
          ],
          "total_cost": 2898
      }
    ]
    @orders_list2 = [
      {
          "id": 3,
          "customer_id": 5,
          "customer_name": "Cathy Spinka",
          "customer_address": "7757 Darwin Causeway, Gerlachfort, 19822",
          "restaurant_id": 1,
          "restaurant_name": "Fast Pub",
          "restaurant_address": "5398 Quigley Harbor, North Lynelle, 60808",
          "courier_id": 3,
          "courier_name": "Cathy Spinka",
          "status": "in progress",
          "products": [
              {
                  "product_id": 2,
                  "product_name": "Vegetable Soup",
                  "quantity": 2,
                  "unit_cost": 1975,
                  "total_cost": 3950
              },
              {
                  "product_id": 4,
                  "product_name": "Peking Duck",
                  "quantity": 1,
                  "unit_cost": 175,
                  "total_cost": 175
              },
              {
                  "product_id": 6,
                  "product_name": "Pasta Carbonara",
                  "quantity": 2,
                  "unit_cost": 925,
                  "total_cost": 1850
              }
          ],
          "total_cost": 5975
      }
  ]
  @orders_list3 = [
    {
        "id": 13,
        "customer_id": 5,
        "customer_name": "Cathy Spinka",
        "customer_address": "7757 Darwin Causeway, Gerlachfort, 19822",
        "restaurant_id": 4,
        "restaurant_name": "Silver Grill",
        "restaurant_address": "5515 Sol Inlet, Shelbyfurt, 49433-4387",
        "courier_id": 5,
        "courier_name": "Rev. Lavina Cartwright",
        "status": "delivered",
        "products": [
            {
                "product_id": 22,
                "product_name": "Pappardelle alla Bolognese",
                "quantity": 1,
                "unit_cost": 1274,
                "total_cost": 1274
            },
            {
                "product_id": 20,
                "product_name": "French Fries with Sausages",
                "quantity": 1,
                "unit_cost": 1624,
                "total_cost": 1624
            }
        ],
        "total_cost": 2898
    }
]
  end

  test "update order status to 'pending'" do
    post "/api/order/#{@order.id}/status", params: { status: "pending" }
    assert_response :success
    assert_equal "pending", @order.reload.order_status.name
  end

  test "update order status to 'in progress'" do
    post "/api/order/#{@order.id}/status", params: { status: "in progress" }
    assert_response :success
    assert_equal "in progress", @order.reload.order_status.name
  end

  test "update order status to 'delivered'" do
    post "/api/order/#{@order.id}/status", params: { status: "delivered" }
    assert_response :success
    assert_equal "delivered", @order.reload.order_status.name
  end

  test "return 422 error for invalid status" do
    post "/api/order/#{@order.id}/status", params: { status: "invalid" }
    assert_response 422
  end

  test "return 422 error for invalid order" do
    post "/api/order/0/status", params: { status: "pending" }
    assert_response 422
  end

  # New Tests: 
  test "get orders, given user type: customer and id" do
    get "/api/orders", params: { user_type: "customer", user_id: @customer1.id }
    assert_response :success
    assert_equal @orders_list1.to_json, response.body
  end

  test "get orders, given user type: restaurant and id" do
    get "/api/orders", params: { user_type: "restaurant", user_id: @restaurant1.id }
    assert_response :success
    assert_equal @orders_list2.to_json, response.body
  end

  test "get orders, given user type: courier and id" do
    get "/api/orders", params: { user_type: "courier", user_id: @courier2.id }
    assert_response :success
    assert_equal @orders_list3.to_json, response.body
  end

  test "get orders with invalid user type" do
    get "/api/orders", params: { user_type: "employee", user_id: @employee.id }
    assert_response 422
    assert_equal({ error: "Invalid user type" }.to_json, response.body)
  end

  test "get orders with valid user type and id not found" do
    get "/api/orders", params: { user_type: "customer", user_id: 999 }
    assert_response :success
    assert_equal [].to_json, response.body
  end

  test "get orders without user typr and with id" do
    get "/api/orders", params: { user_id: @customer1.id }
    assert_response 400
    assert_equal({ error: "Both 'user type' and 'id' parameters are required" }.to_json, response.body)
  end

  test "get orders with user typr and without id" do
    get "/api/orders", params: { user_type: "customer" }
    assert_response 400
    assert_equal({ error: "Both 'user type' and 'id' parameters are required" }.to_json, response.body)
  end
  
end

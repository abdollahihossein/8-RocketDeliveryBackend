json.extract! customer, :id, :phone, :email, :active, :created_at, :updated_at
json.url customer_url(customer, format: :json)

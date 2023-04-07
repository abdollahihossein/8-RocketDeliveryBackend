json.extract! employee, :id, :phone, :email, :created_at, :updated_at
json.url employee_url(employee, format: :json)

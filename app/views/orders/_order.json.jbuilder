json.extract! order, :id, :first_name, :last_name, :address, :district, :sub_district, :province, :zip_code, :total_price, :status, :created_at, :updated_at
json.url order_url(order, format: :json)

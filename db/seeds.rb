User.create(email: 'admin1@simpleshop.com', password: '1234567890', password_confirmation: '1234567890', role: 'admin')

(1..10).each do |i|
  User.create(email: "customer#{i}@simpleshop.com", password: '1234567890', password_confirmation: '1234567890', role: 'customer')
end

Region.create(title: 'Bath', currency_details: 'THB', tax_details: '7', country_details: 'Thailand')
Region.create(title: 'US Dollar', currency_details: 'USD', tax_details: '7', country_details: 'United State of America')
Region.create(title: 'Euro', currency_details: 'EUR', tax_details: '7', country_details: 'France')
Region.create(title: 'Pound', currency_details: 'GBP', tax_details: '7', country_details: 'United Kingdom')

(1..4).each do |i|
  Store.create(name: "Store#{i}", region_id: i)
end

(1..20).each do |i|
  product = Product.create(title: "Product#{i}", description: "description product #{i}", sku: "SKU#{i}", price: i * 200)
  product.create_stock(stock_number: i * 50)
end

Region.all.each do |r|
  arr = Array (1..20)
  r.create_product_sets(arr.sample(5))
end
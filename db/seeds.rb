require 'csv'
require './app/models/merchant'

OPTIONS = { headers: true, header_converters: :symbol }

# Populate Merchants table

CSV.foreach('./data/merchants.csv', OPTIONS) do |merchant|
  Merchant.create(merchant.to_h)
end

# Populate Items table

CSV.foreach('./data/items.csv', OPTIONS) do |item|
  Item.create(item.to_h)
end

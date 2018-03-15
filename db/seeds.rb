require 'csv'
require './app/models/merchant'
require './app/models/item'
require './app/models/invoice_item'

OPTIONS = { headers: true, header_converters: :symbol }

# Populate Merchants table

CSV.foreach('./data/merchants.csv', OPTIONS) do |merchant|
  Merchant.create(merchant.to_h)
end

# Populate Items table

CSV.foreach('./data/items.csv', OPTIONS) do |item|
  Item.create(item.to_h)
end

# Populate InvoiceItems table

CSV.foreach('./data/invoice_items.csv', OPTIONS) do |invoice_item|
  InvoiceItem.create(invoice_item.to_h)
end
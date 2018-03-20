require 'csv'
require './app/models/merchant'
require './app/models/invoice'
require './app/models/item'
require './app/models/invoice_item'

OPTIONS = { headers: true, header_converters: :symbol }

# Populate Merchants table

CSV.foreach('./data/merchants.csv', OPTIONS) do |merchant|
  Merchant.create(merchant.to_h)
end

# Populate Invoices table

CSV.foreach('./data/invoices.csv', OPTIONS) do |invoice|
  Invoice.create(invoice.to_h)
end

# Populate Items table

CSV.foreach('./data/items.csv', OPTIONS) do |item|
  Item.create(
    id: item[:id],
    title: item[:name],
    description: item[:description],
    price: item[:unit_price],
    merchant_id: item[:merchant_id],
    created_at: item[:created_at],
    updated_at: item[:updated_at],
    image_url: './pictures/items_is_items.jpg'
  )
end

# Populate InvoiceItems table

CSV.foreach('./data/invoice_items.csv', OPTIONS) do |invoice_item|
  InvoiceItem.create(invoice_item.to_h)
end

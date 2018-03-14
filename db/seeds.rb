require 'csv'
require './app/models/merchant'
require './app/models/invoice'

OPTIONS = { headers: true, header_converters: :symbol }

# Populate Merchants table

CSV.foreach('./data/merchants.csv', OPTIONS) do |merchant|
  Merchant.create(merchant.to_h)
end

# Populate Invoices table

CSV.foreach('./data/invoices.csv', OPTIONS) do |invoice|
  Invoice.create(invoice.to_h)
end

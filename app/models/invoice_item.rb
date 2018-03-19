class InvoiceItem < ActiveRecord::Base
  validates :item_id, presence: true
  validates :invoice_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true
  belongs_to :invoice
  belongs_to :item


  def self.invoice_view(invoice_id)
    ii = where(invoice_id: invoice_id).to_a

    items = ii.map do |x|
      Item.find(x.item_id)
    end

    c = ii.zip(items).to_h

    receipts = c.map{ |k, v| { quantity: k[:quantity], price: v[:price] } }
    total = c.map{ |k,v| k[:quantity] * v[:price] }.sum


    { total: total, receipts: receipts }
  end
end

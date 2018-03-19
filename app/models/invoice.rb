class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true

  def self.pending
    amount = all.count { |invoice| invoice.status == 'pending' }
    amount * 100 / all.length
  end

  def self.shipped
    amount = all.count { |invoice| invoice.status == 'shipped' }
    amount * 100 / all.length
  end

  def self.returned
    amount = all.count { |invoice| invoice.status == 'returned' }
    amount * 100 / all.length
  end

  def self.highest_price
    self.all.max_by do |invoice|
      invoice_items = InvoiceItem.where(invoice_id: invoice.id).to_a
      invoice_items.sum { |ii| ii.quantity * ii.unit_price }
    end
  end

  def self.lowest_price

  end

  def self.highest_quantity

  end

  def self.lowest_quantity

  end
end

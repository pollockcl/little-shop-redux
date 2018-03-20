require 'pry'
class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :merchant

  def self.pending
    where("status = 'pending'").size * 100 / all.size
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
    high = InvoiceItem.maximum('unit_price')
    InvoiceItem.where(unit_price: high).to_a
  end

  def self.lowest_price
    low = InvoiceItem.minimum('unit_price')
    InvoiceItem.where(unit_price: low).to_a
  end

  def self.highest_quantity
    high = InvoiceItem.maximum('quantity')
    InvoiceItem.where(quantity: high).to_a
  end

  def self.lowest_quantity
    low = InvoiceItem.minimum('quantity')
    InvoiceItem.where(quantity: low).to_a
  end
end

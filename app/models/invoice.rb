require 'pry'
class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true
  has_many :invoice_items

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
    all.max_by { |invoice| invoice.invoice_items.maximum('unit_price') }.id
  end

  def self.lowest_price
    all.min_by { |invoice| invoice.invoice_items.maximum('unit_price') }.id
  end

  def self.highest_quantity
    all.max_by { |invoice| invoice.invoice_items.maximum('quantity') }.id
  end

  def self.lowest_quantity
    all.min_by { |invoice| invoice.invoice_items.maximum('quantity') }.id
  end
end

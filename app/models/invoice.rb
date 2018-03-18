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

  end

  def self.lowest_price

  end

  def self.highest_quantity

  end

  def self.lowest_quantity

  end
end

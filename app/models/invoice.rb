class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :merchant

  def self.pending
    where("status = 'pending'").size * 100 / all.size
  end

  def self.shipped
    where("status = 'shipped'").size * 100 / all.size
  end

  def self.returned
    where("status = 'returned'").size * 100 / all.size
  end

  def self.highest_price
    InvoiceItem.select('invoice_id, sum(unit_price) as unit_price')
               .group(:invoice_id)
               .order('unit_price DESC')
               .limit(1).first
  end

  def self.lowest_price
    InvoiceItem.select('invoice_id, sum(unit_price) as unit_price')
               .group(:invoice_id)
               .order('unit_price ASC')
               .limit(1).first
  end

  def self.highest_quantity
    InvoiceItem.select('invoice_id, sum(quantity) as quantity')
               .group(:invoice_id)
               .order('quantity DESC')
               .limit(1).first
  end

  def self.lowest_quantity
    InvoiceItem.select('invoice_id, sum(quantity) as quantity')
               .group(:invoice_id)
               .order('quantity ASC')
               .limit(1).first
  end
end

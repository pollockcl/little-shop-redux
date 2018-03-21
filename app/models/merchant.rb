class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :invoices
  has_many :items

  def self.most_items
    all.max_by do |merchant|
      merchant.items.size
    end
  end

  def self.highest_price
    high = Item.maximum('price')
    all.find(Item.where(price: high).to_a.first.merchant_id)
  end

  def avg_price
    items.map(&:price).sum / items.size
  end

  def total_cost
    items.sum(:price)
  end
end

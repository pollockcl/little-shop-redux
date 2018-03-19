class Merchant < ActiveRecord::Base
  validates :name, presence: true
  has_many :items

  def self.most_items
    all.max_by(&:item_count)
  end

  def self.high_price
    high = Item.maximum('merchant_id')
    Item.where(price: high).to_a
  end

  def item_count
    Item.where(merchant_id: id).to_a.count
  end

  def avg_price
    items = Item.where(merchant_id: id).to_a
    items.map(&:price).sum / items.count
  end

  def total_cost

  end
end

class Merchant < ActiveRecord::Base
  validates :name, presence: true

  def self.most_items

  end

  def self.high_price

  end

  def item_count

  end

  def avg_price

  end

  def total_cost

  end
end

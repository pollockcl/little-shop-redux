class Merchant < ActiveRecord::Base
  validates :name, presence: true

  def item_count

  end

  def avg_price

  end

  def total_cost

  end
end

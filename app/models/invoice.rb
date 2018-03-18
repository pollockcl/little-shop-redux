class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true

  def self.pending

  end

  def self.shipped

  end

  def self.returned

  end

  def self.highest_price

  end

  def self.lowest_price

  end

  def highest_quantity

  end

  def lowest_quantity

  end
end

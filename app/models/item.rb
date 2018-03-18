class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :merchant_id, presence: true

  belongs_to :merchant

  def self.count
    self.all.length
  end

  def self.oldest

  end

  def self.newest

  end

  def self.average_price
    average(:price).round(2)
  end

end

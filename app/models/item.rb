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
    self.all.order(:created_at).last.title
  end

  def self.newest
    self.all.order(:created_at).first.title
  end

  def self.average_price
    average(:price).round(2)
  end

end

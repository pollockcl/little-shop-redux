class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :merchant_id, presence: true
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.oldest
    all.order(created_at: :desc).first
  end

  def self.newest
    all.order(:created_at).first

  end

  def self.average_price
    average(:price).round(2)
  end

end

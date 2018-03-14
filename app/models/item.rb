class Item < ActiveRecord::Base
  validates :tite, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true
  alias_attribute :title, :name
  alias_attribute :price, :unit_price
end

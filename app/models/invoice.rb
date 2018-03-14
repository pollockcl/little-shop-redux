class Invoice < ActiveRecord::Base
  validates :merchant_id, presence: true
end

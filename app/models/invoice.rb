class Invoice < ActiveRecord::Base
  validates :merchant_id, status: true
end

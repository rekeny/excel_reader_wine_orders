class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
  has_many :reports, dependent: :destroy

  def self.dispatched(dispatched)
    !dispatched
  end

  def self.delivered(delivered)
    !delivered
  end
end

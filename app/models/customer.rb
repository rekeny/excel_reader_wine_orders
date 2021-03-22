class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
  has_many :reports, dependent: :destroy
  validates :order_num, presence: true, uniqueness: true
  validates :name, :address1, :town, :postcode, :email, presence: true

  def self.dispatched(dispatched)
    !dispatched
  end

  def self.delivered(delivered)
    !delivered
  end
end

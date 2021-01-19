class Customer < ApplicationRecord
  has_many :orders
  has_many :products, through: :orders
  has_many :reports
  # , dependant: :destroy

  def self.ready(ready)
    !ready
  end
end

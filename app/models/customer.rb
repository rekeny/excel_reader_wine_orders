class Customer < ApplicationRecord
  has_many :orders, dependant: :destroy
  has_many :products, through: :orders
end

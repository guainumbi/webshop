class Order < ApplicationRecord
  has_many :selections
  has_many :items, through: :selections, dependent: :destroy

end

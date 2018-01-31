class Order < ApplicationRecord
  has_many :selected_items
  has_many :items, through: :selected_items

end

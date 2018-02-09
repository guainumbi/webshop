class Item < ApplicationRecord
  has_many :selected_items
  has_many :orders, through: :selected_items
end

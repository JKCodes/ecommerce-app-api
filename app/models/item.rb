class Item < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy
  has_many :carts, through: :line_items

  validates :title, :inventory, :price, presence: true
end

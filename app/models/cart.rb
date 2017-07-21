class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  def add_item(item, quantity)
    if item.inventory != 0
      line_item = self.line_items.find_by(item_id: item)
      if line_item
        line_item.update(quantity: set_quantity(line_item, item, quantity))
      else
        self.line_items.create(item: item, quantity: set_quantity(item, quantity))
      end
    end
  end

  def set_quantity(line_item = nil, item, quantity)
    if line_item 
      quantity_to_update = line_item.quantity + quantity
      item.is_inventory_available?(quantity_to_update) ? quantity_to_update : item.inventory
    else
      item.is_inventory_available?(quantity) ? quantity : item.inventory
    end
  end
end

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
      item.update_inventory_count(quantity, 'remove')
    end
  end

  def set_quantity(line_item = nil, item, quantity)
    if line_item 
      quantity_to_update = line_item.quantity + quantity
      item.is_inventory_available?(quantity) ? quantity_to_update : item.inventory
    else
      item.is_inventory_available?(quantity) ? quantity : item.inventory
    end
  end

  def total
    self.line_items.inject(0) { |sum, item| item.total + sum }
  end

  def checkout
    order = self.user.orders.create
    self.line_items.each do |line_item|
      order.order_items.create(item_id: line_item.item_id, quantity: line_item.quantity)
    end
    self.line_items.destroy_all
  end
end

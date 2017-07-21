require 'rails_helper'

RSpec.describe LineItem, type: :model do

  describe 'validation' do

    it 'requires a car and an item' do
      line_item = LineItem.new

      expect(line_item.valid?).to eq(false)
      expect(line_item.errors.full_messages).to eq([
        "Cart must exist",
        "Item must exist"
      ])
    end
  end

  describe 'relationships' do

    it 'belongs to an item'

    it 'belongs to a cart'
  end
end

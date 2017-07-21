require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'validations' do
    
    it 'requires a title, inventory count, price, and a category' do
      item = Item.new

      expect(item.valid?).to eq(false)
      expect(item.errors.full_messages).to eq([
        "Category must exist",
        "Title can't be blank",
        "Inventory can't be blank",
        "Price can't be blank"
      ])
    end
  end

  describe 'relationships' do

    it 'belongs to a category' do
      item = create(:item)

      expect(item.category.title).to eq("clothing")
    end

    it 'has many line items'

    it 'has many order items'
  end
end

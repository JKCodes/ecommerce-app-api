require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe 'validation' do
    
    it 'requires a user upon creation' do
      cart = build(:cart, user: nil)

      expect(cart.valid?).to eq(false)
      expect(cart.errors.full_messages).to eq([
        'User must exist'
      ])
    end
  end

  describe 'relationships' do

    it 'has many line items that are destroyed upon deltion of cart'

    it 'has many items through line items'

    it 'belongs to a user'
  end
end

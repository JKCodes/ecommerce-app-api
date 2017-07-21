require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validation' do

    it 'requires an email and password upon creation'

    it 'requres that an email is unique'
  end

  describe 'relationships' do

    it 'has one cart'

    it 'has many order'
  end
end

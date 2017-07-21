require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validation' do

    it 'requires an email and password upon creation' do
      user = build(:user, email: nil, password: nil)

      expect(user.valid?).to equal(false)
      expect(user.errors.full_messages).to eq([
        "Password can't be blank",
        "Email can't be blank"
      ])
    end

    it 'requres that an email is unique'
  end

  describe 'on save' do

    it 'hashes the password'
  end

  describe 'relationships' do

    it 'has one cart'

    it 'has many order'
  end
end

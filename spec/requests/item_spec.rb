require 'rails_helper'

RSpec.describe 'Items', type: :request do
  describe 'Integration Tests for Items' do
    before(:each) do
      @mahabub = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '1234567', password_confirmation: '1234567')
      @liability = Balance.create(name: 'Liability', icon: 'icon_link', author: @mahabub)
      @item = Item.create(name: 'Item', amount: 99)
    end

    describe 'render new page' do
      before(:each) do
        sign_in @mahabub
        get new_balance_item_path(@liability.id)
      end

      it 'should render new page' do
        expect(response.status).to eq(200)
        expect(response.body).to include('Add Record')
      end
    end
  end
end

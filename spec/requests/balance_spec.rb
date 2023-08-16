require 'rails_helper'
require 'faker'

RSpec.describe 'Balances', type: :request do
  describe 'Integration Tests for Balances/Groups' do
    before(:each) do
      @mahabub = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '1234567', password_confirmation: '1234567')
      @liability = Balance.create(name: 'Liability', icon: 'http://', author: @mahabub)
    end
    it 'should render the home page' do
      get '/'
      expect(response.status).to eq(302)
    end
    describe 'loged in users ability' do
      before(:each) do
        sign_in @mahabub
        get '/'
      end
      it 'should render the Balance Sheet page' do
        expect(response.status).to eq(200)
        expect(response.body).to include('Transactions')
      end

      it 'should render the balance sheet catagories' do
        expect(response.body).to include('Liability')
      end

      it 'should render the add new balance buttons' do
        expect(response.body).to include('add group')
      end

      it 'should render the new balance page' do
        get new_balance_path
        expect(response.status).to eq(200)
        expect(response.body).to include('Name')
      end

      it 'should render the Balance Detail page' do
        get balance_path(@liability.id)
        expect(response.status).to eq(200)
        expect(response.body).to include('Liability')
      end
    end
  end
end

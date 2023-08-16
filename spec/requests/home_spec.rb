require 'rails_helper'

RSpec.describe 'Home page', type: :request do
  describe 'GET /' do
    it 'should display the home page by redirecting' do
      get '/home'
      expect(response.status).to eq(200)
      expect(response.body).to include('Expense Tracker')
      expect(response.body).to include('LOG IN')
    end
  end
end

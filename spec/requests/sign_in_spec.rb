require 'rails_helper'

RSpec.describe '#sign_in' do
  let(:user) { create(:user) }
  
  context 'with valid params' do
    let(:login_user) do
      post '/api/v1/auth/sign_in', params: { email: user.email, password: user.password }
    end
  
    it 'request should be successful' do
      login_user
      expect(response).to have_http_status(:ok)
    end
    
    it 'check auth headers' do
      login_user
      expect(response.headers['uid']).to be_present
      expect(response.headers['client']).to be_present
      expect(response.headers['access-token']).to be_present
    end
  end
  context 'with invalid params' do
    let(:login_user) do
      post '/api/v1/auth/sign_in', params: { email: user.email, password: 'InvalidPassword' }
    end
    
    it 'request should be unauthorized' do
      login_user
      expect(response).to have_http_status(:unauthorized)
    end
  end
end

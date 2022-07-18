require 'rails_helper'

RSpec.describe '#sign_up' do
  let(:user) { build(:user) }
  let(:register) do
    post '/api/v1/auth/', params: { email: user.email, password: user.password, password_confirmation: user.password }
  end

  it 'create a new user' do
    expect do
      register
    end.to change(User, :count).by(1)
  end

  it 'request should be successful' do
    register
    expect(response).to have_http_status(:ok)
  end
end

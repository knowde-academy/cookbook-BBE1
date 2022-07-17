require 'rails_helper'

RSpec.describe DeviseTokenAuth::RegistrationsController, type: :controller do
    
    context " register new user" do
      let(:user) { build (:user) }
      before :each do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        post :create, params:{email: user.email, password: user.password, password_confirmation: user.password}
        @data = JSON.parse(response.body)
      end
      
      it "request should be successful" do
        expect(response).to have_http_status(200)
      end
    end
    
    context "login user" do
      before :each do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = FactoryBot.create(:user)
        sign_in user
      end
      
      it "request should be successful" do
        expect(response).to have_http_status(200)
      end
      
      it "return auth headers" do
       
      end
    end
end
require 'rails_helper'

RSpec.describe AdminController, :type => :controller do

  before :each do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create :admin

  end

  describe "GET users" do
    it "returns http success when logged in as admin" do
      sign_in @admin
      get :users
      expect(response).to be_success
    end
    it "returns http success when logged in as admin" do
      sign_in @user
      expect {get :users}.to raise_exception(CanCan::AccessDenied)
    end
  end

end

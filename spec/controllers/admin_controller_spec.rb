require 'rails_helper'

RSpec.describe AdminController, :type => :controller do

  describe "GET users" do
    it "returns http success" do
      get :users
      expect(response).to be_success
    end
  end

end

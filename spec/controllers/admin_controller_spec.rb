require 'rails_helper'

RSpec.describe AdminController, :type => :controller do

  describe "GET 'manage_users'" do
    it "returns http success" do
      get 'manage_users'
      expect(response).to be_success
    end
  end

end

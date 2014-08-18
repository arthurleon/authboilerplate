require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET 'lowcredentials'" do
    it "returns http success" do
      get 'lowcredentials'
      expect(response).to be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      expect(response).to be_success
    end
  end

  describe "GET 'dashboard'" do
    it "returns http success" do
      get 'dashboard'
      expect(response).to be_success
    end
  end

end

class PagesController < ApplicationController
  before_filter :authenticate_user!
  skip_authorization_check  
  
  def lowcredentials
  end

  def about
  end

  def dashboard
  end
end

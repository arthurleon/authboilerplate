class ApplicationController < ActionController::Base
  #configurar paramentros dos Roles
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Redireciona para ROOT se houver erro de acesso e mostra uma mensagem de erro
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

   protected
  
  #parametros do devise que podem ser alterando com a ação :account_update 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :current_password) }
  end

end

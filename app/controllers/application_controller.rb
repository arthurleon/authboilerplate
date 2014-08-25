class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Tornar obrigatório que todos os controllers tenham uma verificação com excessão do Devise
  check_authorization :unless => :devise_controller?
  
  # Redireciona para ROOT se houver erro de acesso e mostra uma mensagem de erro
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to pages_lowcredentials_path, :alert => exception.message
  end

   protected
  
  #parametros do devise que podem ser alterando com a ação :account_update 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] }, :email, :name, :password, :password_confirmation, :current_password) }
  end
  
end

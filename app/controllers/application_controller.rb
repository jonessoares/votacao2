class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_user!
 skip_before_action :verify_authenticity_token

  protected
  # permitir adicionar o atributo name através do metodo do devise sign_up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end

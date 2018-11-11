class ApplicationController < ActionController::Base
	before_action :authenticate_user!,:only => [:show, :index, :edit,]
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
  		user_path(current_user.id)
	end

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  Refile.secret_key = '483e9f861616c6d1c3ce1357bcd9a5e8c4ae2f457a3833a86baa8b9d2208997aaa78a01d5ff6415921e29277ee418365796621d4b5a1ceae427734510aac0c9d'
end

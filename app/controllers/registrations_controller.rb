class RegistrationsController < Devise::RegistrationsController

	before_action :configure_sign_up_params, only: [:create]

	def create
		super
	end

	def configure_sign_up_params
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

	private

	def sign_up_params
		params.require(:users).permit(:username, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:users).permit( :username, :email, :password, :password_confirmation, :current_password)
	end

end
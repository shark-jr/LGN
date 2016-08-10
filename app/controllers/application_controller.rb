class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit( :email, :password, :password_confirmation, :username )
    end

    devise_parameter_sanitizer.for(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :username, :zip, :profile_img)
    end
  end

<<<<<<< HEAD
=======
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  Warden::Manager.after_authentication do |user, auth, opts|
    user_ip_address = user.current_sign_in_ip.to_s
    location_based_on_ip = Geocoder.search(user_ip_address).first
    user.city = location_based_on_ip.data['city']
    user.state = location_based_on_ip.data['region_code']
    user.country = location_based_on_ip.data['country_name']
    user.zip = location_based_on_ip.data['zip_code']
    user.save
  end
>>>>>>> 48b1586c309df889eaf49ffa001b941fd60182a7
end

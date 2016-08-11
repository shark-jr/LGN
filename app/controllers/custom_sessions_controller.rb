class CustomSessionsController < Devise::SessionsController
  after_action :after_login, :only => :create
  private

  def after_login
    location_based_on_ip = lookup_ip_location
    current_user.city = location_based_on_ip.data['city']
    current_user.state = location_based_on_ip.data['region_code']
    current_user.country = location_based_on_ip.data['country_name']
    current_user.zip = location_based_on_ip.data['zip_code']
    current_user.latitude = location_based_on_ip.data['latitude']
    current_user.longitude = location_based_on_ip.data['longitude']
    current_user.save
  end

  def lookup_ip_location
    if Rails.env.development?
      Geocoder.search(request.remote_ip).first
    else
      request.location
    end
  end

end

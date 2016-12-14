class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! #if not :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me,:privilege]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  def after_sign_in_path_for(resource_or_scope)
     root_path
  end
  def after_sign_up_path_for(resource_or_scope)
    session[:previous_url] || root_path
  end
  def access
    if current_user.privilege =="Member"
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You have no authority to access.' }
      end
    end
  end
  def rights(u)
    if current_user !=u
      respond_to do |format|
        format.html {redirect_to root_path, notice: 'You have no authority to access.' }
      end
    end
  end
  zone = ActiveSupport::TimeZone.new("America/New_York")
  Time.now.in_time_zone(zone)
end

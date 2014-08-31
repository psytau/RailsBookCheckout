class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  hide_action :current_user
  helper_method :admin_user
  hide_action :admin_user

  def after_sign_in_path_for resource
    current_user.increment!(:sign_in_counter)
    super
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # monkey patch this over the one supplied by devise
  # to be able to switch users as admin
  def current_user
    if session[:view_as_user]
      @admin_user = warden.authenticate(scope: :user)
      @current_user ||= User.find(session[:view_as_user])
    else
      @current_user ||= warden.authenticate(scope: :user) # this is as it is in devise
    end
    @current_user
  end

  def admin_user
    @admin_user
  end
end

class ApplicationController < ActionController::Base
  helper_method :current_admin, :admin_signed_in?, :current_user, :user_signed_in?, :current_cart

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def admin_signed_in?
    current_admin.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def current_cart
    session[:cart_session_id] ||= SecureRandom.hex(10)
    Cart.find_or_create_by(session_id: session[:cart_session_id])
  end
end

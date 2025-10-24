class Users::MypagesController < ApplicationController
  def require_login
    redirect_to users_sign_in_path unless user_signed_in?
  end


  def show
    @user = User.find(params[:id])
  end

  private

  def require_login
    redirect_to users_sign_in_path unless user_signed_in?
  end
end

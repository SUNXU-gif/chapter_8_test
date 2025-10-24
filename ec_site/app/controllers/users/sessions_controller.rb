class Users::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to users_mypage_path(user)
    else
      redirect_to users_sign_in_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to users_sign_in_path
  end
end

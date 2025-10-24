class Admins::SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin && admin.password == params[:password]
      session[:admin_id] = admin.id
      redirect_to admins_books_path
    else
      redirect_to admins_sign_in_path
    end
  end

  def destroy
    session.delete(:admin_id)
    redirect_to admins_sign_in_path
  end
end

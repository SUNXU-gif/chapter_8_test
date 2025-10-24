class Admins::TagsController < ApplicationController
  before_action :require_admin

  def index
    @tags = Tag.order(:id)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admins_tags_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to admins_tags_path
  end

  private

  def require_admin
    redirect_to admins_sign_in_path unless admin_signed_in?
  end

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end

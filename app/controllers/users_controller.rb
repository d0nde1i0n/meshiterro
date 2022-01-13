class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images #特定のユーザに紐づけられた投稿全てを取得し、@post_imagesに渡す
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user = User.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image)
  end
end
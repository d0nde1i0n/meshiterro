class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @post_images = @user.post_images.page(params[:page])
    #特定のユーザに紐づけられた投稿全てを取得し、@post_imagesに渡す
    #pageは、gem「kaminari」によってしよう可能となったメソッド
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
class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

# 投稿データの保存
 def create
   @post_image = PostImage.new(post_image_params)
   #current_user.idはログイン中のユーザidを受け取れるdeviseのヘルパーメソッド
   @post_image.user_id = current_user.id
   if @post_image.save
     redirect_to post_images_path
   else
     render :new
   end
 end

  def index
    @post_images = PostImage.page(params[:page])
    # pageは、gem「kaminari」によってしよう可能となったメソッド
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.delete
    redirect_to post_images_path
  end

  private
  # ストロングパラメータ
  # フォームで入力されたでテータが、投稿データとして許可されているパラメータであることをチェック
  def post_image_params
    params.require(:post_image).permit(:shop_name,:image,:caption)
  end
end

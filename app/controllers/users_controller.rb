class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
  	@user = User.find(params[:id])
    @posts = @user.posts.order(created_at: "DESC").page(params[:page])
    @users = @user.following_user.page(params[:page])
    @followers = @user.follower_user.page(params[:page])
    @favorites = @user.favorited_posts.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def withdraw
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    unless @user.deleted_at.nil?
      @user.destroy
      flash[:notice] = "またのご利用をお待ちしております。"
      reset_session
      redirect_to root_path
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :pro_image, :introduction, :deleted_at)
  	end
end

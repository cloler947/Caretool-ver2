class FavoritesController < ApplicationController
  before_action :authenticate_user!


  def create
  	@post = Post.find(params[:post_id])
  	 if user_signed_in?
      favorite = @post.favorites.new(user_id: current_user.id)
  	  favorite.save
    else
      redierect_to new_user_session_path
    end
  end

  def index
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	if user_signed_in?
      favorite = current_user.favorites.find_by(post_id: @post.id)
  	   favorite.destroy
    else 
      redeirect_to new_user_session_path
    end
  end
end

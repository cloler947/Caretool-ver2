class HomeController < ApplicationController
  def about
  end

  def top
    @posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))

  end

  def copy_right
  end
end

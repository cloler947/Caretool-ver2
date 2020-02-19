class PostCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@post_comment = current_user.post_comments.new(post_comment_params)
		@post_comment.post_id= @post.id
		@post_comment.save
		redirect_to post_path(@post)
	end

	def destroy
		@post_comment = PostComment.find(params[:post_id])
		@post_comment.destroy
		redirect_back(fallback_location: posts_path)
	end

	private
		def post_comment_params
			params.require(:post_comment).permit(:user_id, :post_id, :comment)
		end
end

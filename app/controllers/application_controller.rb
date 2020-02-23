class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search

 private
	def after_sign_in_path_for(resource)
    	home_top_path
  end

	def after_sign_out_path_for(resource)
	  root_path
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

	def set_search
		@search = Post.ransack(params[:q])
		@posts = @search.result.page(params[:page])
	end
end

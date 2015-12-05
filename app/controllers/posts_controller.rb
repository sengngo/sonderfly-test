class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
	
	def index
		@posts = Post.all.order("created_at DESC")
		# change to categories
	end

	def show
		@comments = Comment.where(post_id: @post)
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
		@post.save

		if @post.valid? 
			redirect_to @post
		else
			render 'new', :status => :unprocessable_entity
		end
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
	end

	def destroy
		@post.destroy
		redirect_to root_path
		#will need to change to user dashboard
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :intro, :body, :cover_photo, :post_photo)
	end

end

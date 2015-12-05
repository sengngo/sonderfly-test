class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params.merge(:user => current_user))

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def edit
		@comment = Comment.find(params[:id])

		if @comment.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.update_attributes(comment_params)
		if @comment.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end

		if comment.valid?
			redirect_to post_path(@post)
		else
			render :edit, :status => :unprocessable_entity
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
		
		@comment.destroy
		redirect_to post_path(@post)
	end

	private

	def comment_params
		params.require(:comment).permit(:message)
	end

end

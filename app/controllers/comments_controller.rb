class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_comment, only: [:create, :show, :edit, :update, :destroy]

	def create
		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def edit
		if @comment.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
	end

	def update
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

		if @comment.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
		
		@comment.destroy
		redirect_to post_path(@post)
	end

	private

	def find_comment
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params.merge(:user => current_user))
	end

	def comment_params
		params.require(:comment).permit(:message)
	end

end

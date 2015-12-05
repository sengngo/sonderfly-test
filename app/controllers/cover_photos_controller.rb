class CoverPhotosController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@cover_photo = @post.cover_photo.create(cover_photo_params.merge(:user => current_user))

	end

	private

	def cover_photo_params.require(:cover_photo).permit(:caption)
end

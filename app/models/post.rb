class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	has_one :cover_photo

	has_many :comments
	has_many :post_photos
	has_many :tags

	mount_uploader :cover_photo, CoverPhotoUploader
	mount_uploader :post_photo, PostPhotoUploader
end

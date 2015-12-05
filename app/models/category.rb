class Category < ActiveRecord::Base
	has_many :posts
	has_one :cover_photo
end

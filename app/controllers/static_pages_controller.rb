class StaticPagesController < ApplicationController
	def welcome
		@posts = Post.last(5)
	end

	def about
		# user's who are admins = link_to profile page
	end

	def contact
	end

	def guidelines
	end

	def terms
	end
end

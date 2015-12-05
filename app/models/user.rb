class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :role
  
  has_many :posts
  has_many :post_photos
  has_many :cover_photos
  has_one :profile_image
  has_many :comments

  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "leader_id",
                                   dependent:   :destroy
                                   
  has_many :leading, through: :active_relationships,  source: :lead
  has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :profile_photo, ProfilePhotoUploader
  
  def full_name
	  first_name + " " + last_name
	end

  def follow(other_user)
    active_relationships.create(leader_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(leader_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  # def self.search(search)
    # return User.all unless search
    #   keywords = search.split(/[[:blank:]]+/)
    #   # @users = []
    #   keywords.each do |search|
    #   next search == ""
    #   User.where('name LIKE(?) OR age LIKE(?) OR occupation LIKE(?) OR experience LIKE(?) OR programming_lang LIKE(?) OR pr LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    #   end
  # end
  
  mount_uploader :image, ImageUploader
end

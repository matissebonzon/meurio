class Mobilization < ActiveRecord::Base
  has_many :campaigns
  has_many :problems
  has_many :pokes, through: :campaigns
  has_many :ideas, through: :problems
  has_many :images, primary_key: :hashtag, foreign_key: :hashtag
  has_many :facts
  has_many :comments, primary_key: :hashtag, foreign_key: :hashtag

  mount_uploader :background_image, ImageUploader
end

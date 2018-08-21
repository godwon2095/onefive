class Post < ActiveRecord::Base
  belongs_to :user

  #댓글
  has_many :comments

  #대댓글
  has_many :subcomments

  #좋아요
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :image, PostImageUploader
  mount_uploaders :post_images, EditerUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

  serialize :post_images, JSON # if we user sqlite3
  serialize :song_ids, Array # if we user sqlite3

  def self.search(query)
      self.where("title || content LIKE ?","%#{query}%")
  end

  def include_song?(params)
    self.song_ids.map do |song_id|
      if song_id == params
        return true
      end
    end

    return false
  end

  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end

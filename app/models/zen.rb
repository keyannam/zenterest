class Zen < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, length: { maximum: 20}
  validates :description, length: { maximum: 120}
  validates :link, presence: true

  belongs_to :user
  mount_uploader :photo, PhotoUploader
  end

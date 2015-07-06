class Zen < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, length: { maximum: 20}
  validates :photo, presence: true
  validates :content, length: { maximum: 120}
  validates :link, presence: true
  
  belongs_to :user
end

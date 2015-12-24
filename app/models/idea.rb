class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :pocket
  validates :user_id, presence: true
  validates :pocket_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end

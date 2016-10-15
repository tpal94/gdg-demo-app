class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 140 }
end

class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments

  validates :title, presence: true, length: { in: 6..140 }
  validates :body, presence: true, length: { in: 32..5000 }
end

class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { in: 6..140 }
  validates :body, presence: true, length: { in: 32..5000 }
end

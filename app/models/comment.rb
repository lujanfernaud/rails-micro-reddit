class Comment < ApplicationRecord
  belongs_to :post

  validates :body, presence: true, length: { in: 2..1000 }
end

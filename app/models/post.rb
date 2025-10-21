class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, Length: { in: 5..100 }
  validates :views, numericality: { only_integer: true }
end

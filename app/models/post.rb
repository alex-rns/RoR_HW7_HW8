class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, -> { order "updated_at DESC" }, dependent: :destroy
  validates :title, presence: true, length: {maximum: 30}
  validates :content, presence: true, length: {minimum: 10}
  validates :name, presence: true
  validates :image, url: {allow_blank: true}
end

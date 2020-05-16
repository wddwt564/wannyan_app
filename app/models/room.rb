class Room < ApplicationRecord
    belongs_to :user
  validates :image, length: { minimum: 2 },  allow_nil: true
  has_one_attached :image
  validates_presence_of :user_id, :text
  validates :user_id, :text, presence: { message: "入力してください" }
end

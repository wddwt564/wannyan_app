class Room < ApplicationRecord
    belongs_to :user
#   validates :image, length: { minimum: 2 },  allow_nil: true
  has_one_attached :image
  validates_presence_of :user_id, :text
  validates :genre, :room_name, :text, presence: { message: "入力してください" }
  
  validate :image, if: :was_attached?

  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end
  
end

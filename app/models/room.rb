class Room < ApplicationRecord
    belongs_to :user
  validates :image, length: { minimum: 2 },  allow_nil: true
  has_one_attached :image
  validates_presence_of :user_id, :text
  validates :genre, :room_name, :text, presence: { message: "入力してください" }
  validates :room_name,length: { maximum: 25 } ,presence: { message: "入力してください" }
  
  def self.search(search)
  if search
    Room.where(['genre LIKE ?', "%#{search}%"])
  else
    Room.all
  end
  end
  
  
end

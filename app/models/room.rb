class Room < ApplicationRecord
  belongs_to :user               #usersテーブルとのアソシエーション
  has_many :comments               #commentsテーブルとのアソシエーション
  validates :image, length: { minimum: 2 },  allow_nil: true
  has_one_attached :image
  validates_presence_of :user_id, :text
  validates :genre, :room_name, :text, presence: { message: "を入力してください" }
  validates :room_name,length: { maximum: 25 } ,presence: { message: "を入力してください" }
  
  def self.search(search)
  if search
    Room.where(['genre LIKE ?', "%#{search}%"])
  else
    Room.all
  end
  end
  
  
end

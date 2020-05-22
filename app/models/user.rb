class User < ApplicationRecord
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, :confirmable
   def full_profile?
    image.attached?  && user_name? && age?
  end
  
  has_many :rooms, ->{ order("created_at DESC") }
end

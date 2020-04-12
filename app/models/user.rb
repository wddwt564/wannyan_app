class User < ApplicationRecord
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, :confirmable
         
   def full_profile?
    image.attached?  && user_name? && age?
  end

end

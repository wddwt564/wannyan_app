class User < ApplicationRecord
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, :confirmable
   def full_profile?
    image.attached?  && user_name? && age?
  end
  
  has_many :rooms, ->{ order("created_at DESC") }
  has_many :comments, :dependent => :destroy#退会時コメントも削除
    # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  # ユーザーのアカウントが有効であることを確認 
  def active_for_authentication?  
    # super && (self.deleted_at == false)
    super && !deleted_at 
  end  

  # 削除したユーザーにカスタムメッセージを追加します  
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end 
  
end

class User < ApplicationRecord
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, :confirmable
   def full_profile?
    image.attached?  && user_name? && age?
  end
  
  has_many :rooms, ->{ order("created_at DESC") }
  has_many :comments               #commentsテーブルとのアソシエーション
  
  scope :without_soft_deleted, -> { where(deleted_at: nil) }

  # validatable相当の検証を追加
  validates_uniqueness_of :email, scope: :deleted_at
  validates_format_of :email, with: Devise.email_regexp, if: :will_save_change_to_email?
  validates :password, presence: true, confirmation: true, length: { in: Devise.password_length }, on: :create
  validates :password, confirmation: true, length: { in: Devise.password_length }, allow_blank: true, on: :update
  
    # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  # ユーザーのアカウントが有効であることを確認 
  def active_for_authentication?  
    super && (self.is_deleted == false)
  end  

  # 削除したユーザーにカスタムメッセージを追加します  
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end 
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    self.without_soft_deleted.where(conditions.to_h).first
  end
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end

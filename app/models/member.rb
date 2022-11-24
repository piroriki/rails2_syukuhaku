class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

# uploaderクラスとの関連づけ
  mount_uploader :avatar,AvatarUploader

# roomモデル、reservationモデルとの関連づけ
  has_many :reservations
  has_many :rooms

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 def update_without_current_password(params, *options) # 新規追加
  params.delete(:current_password)

  if params[:password].blank? && params[:password_confirmation].blank?
   params.delete(:password)
   params.delete(:password_confirmation)
  end

  result = update_attributes(params, *options)
  clean_up_passwords
  result
 end

 with_options presence: true do
  validates :name
  validates :email
  validates :profile, length: {maximum: 200 }
 end

end

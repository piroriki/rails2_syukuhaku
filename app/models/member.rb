class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

# roomモデル、reservationモデルとの関連づけ
  has_many :reservations
  has_many :rooms

# uploaderクラスとの関連づけ
  mount_uploader :avatar,AvatarUploader


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

end

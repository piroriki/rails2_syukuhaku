class Reservation < ApplicationRecord

# uploaderとの関連づけ
 mount_uploader :reserve_image,ReserveImageUploader

# memberモデル、roomモデルとの関連づけ
 belongs_to :member
 belongs_to :room

end

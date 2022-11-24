class Reservation < ApplicationRecord

# uploaderとの関連づけ
 mount_uploader :reserve_image,ReserveImageUploader

# memberモデルおよびreservationモデルとの関連づけ
 belongs_to :member

end

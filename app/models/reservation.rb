class Reservation < ApplicationRecord

# memberモデル、roomモデルとの関連づけ
 belongs_to :member
 belongs_to :room

# 使用日数、合計金額を算出する計算式を追加（モデル内では別モデルの変数でもインスタンス変数の形で呼び出さない）
 def sum_of_days
  (finished_day.to_date - started_day.to_date).to_i
 end

 def sum_of_price
  (room.price * people * sum_of_days).to_i
 end

end
class Room < ApplicationRecord
 mount_uploader :image,ImageUploader

 # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match" #roomテーブルで対象となるエリア(この場合のname)に関する検索ワードはどこに保存される？
      @room = Room.where("name LIKE?", "#{word}") #%を追加したところが曖昧検索に該当する
    elsif search == "forward_match"
      @room = Room.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @room = Room.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @room = Room.where("name LIKE?","%#{word}%")
    else
      @room = Room.all #上記条件に合致しなければ、条件なしの検索結果が表示される
    end
  end

end

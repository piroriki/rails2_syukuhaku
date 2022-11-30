class RoomsController < ApplicationController

# user.idは現在ログイン中のユーザーのみで絞り、room.idはログイン中に使用されている関連idのみで絞り込む

 def index
 # @rooms = Room.all
  @rooms = Room.where(member_id: current_member.id)
 end

 def show
  @member = current_member
  @room = Room.find(params[:id])
  @reservation = Reservation.new
 end

 def new
  @room = Room.new
 end
 
 def create
  @room = Room.new(room_params)
  @member = current_member
  if @room.save!
   flash[:notice] = "ルーム登録が完了しました"
   redirect_to room_path(@room)  # ルーム確認画面に飛ばす
  else
   @member = Member.find_by(params[:room][:member_id])
   render "new"
  end
 end

 def search #エリア検索、キーワード検索の双方の機能を設定する
  @member = current_member.id
  @q = Room.ransack(params[:q])
  @results = @q.result(distinct: true)
 end 
 
 private

 def room_params
  params.require(:room).permit(:id, :name, :address, :introduction, :price, :image, :image_cache).merge(member_id:current_member.id)
 end

end

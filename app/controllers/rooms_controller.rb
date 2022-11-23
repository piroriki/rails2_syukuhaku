class RoomsController < ApplicationController

# user.idは現在ログイン中のユーザーのみで絞り、room.idはログイン中に使用されている関連idのみで絞り込む

 def index
  @members = Member.all
  @member = Member.find(current_member.id)
  @rooms = Room.all
 end

 def new
  @Member = Member.find(current_member.id)
  @room = Room.new
 end
 
 def create
  @room = Room.new(params.require(:room).permit(:id, :name, :address, :introduction, :price, :image))
binding.pry
  if @room.save
   flash[:notice] = "ルーム登録が完了しました"
   redirect_to room_path(@room)  # ルーム確認画面に飛ばす
  else
   render "new"
  end
 end

 def show
  @member = Member.find(current_member.id)
  @room = Room.find(params[:id])
  @reservation = Reservation.new
  if @reservation.save
   redirect_to new_reservation_path
  else
   render "new"
  end
 end

 def edit
 end

 def update
  @room = Room.find(params[:id])
  @member = Member.find(params[:id])
  @reservation = Reservation.find(params[:id])
 end

 def destroy
 end

end

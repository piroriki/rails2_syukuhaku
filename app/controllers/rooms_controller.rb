class RoomsController < ApplicationController

# user.idは現在ログイン中のユーザーのみで絞り、room.idはログイン中に使用されている関連idのみで絞り込む

 def index
  @rooms = Room.all
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

 def result
  if params[:address] == ''
   @rooms = Room.all
  else
   @rooms = Room.where('address LIKE ?','%' + params[:address] + '%')
  end
 end

 def search
  if params[:search] == ''
   @searches = Room.all
  else
   @serches = Room.where('name LIKE ? OR introduction LIKE ? OR address LIKE ?','%' + params[:search] + '%', '%' + params[:search] + '%', '%' + params[:search] + '%')
  end
 end

 def destroy
 end

 private
 def room_params
  params.require(:room).permit(:member_id, :id, :name, :address, :introduction, :price, :image, :image_cache)
 end

end

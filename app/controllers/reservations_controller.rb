class ReservationsController < ApplicationController
# member.idは現在ログイン中のユーザーのみに絞り、reservation.idはログイン中のユーザー関連のidのみで絞り込む

 def index
  @reservations = Reservation.where(member_id: current_member.id)
  @reservations = Reservation.all.includes(:room)
 # @reservations_roomid = Reservation.select(:room_id).where(member_id:@member)
 # @rooms = Room.where(id:@reservations_roomid)
 end

 def show
  @reservation = Reservation.find(params[:id])
  @room = Room.find(params[:room_id])
  @reservations = @room.reservations
 end

 def new
  @room = Room.find(params[:reservation][:room_id])
  @reservation = Reservation.new(reservation_params)
  @reservation.price = @reservation.sum_of_price
 end

 def create
  @member = current_member
  @room = Room.find(params[:reservation][:room_id])
  @reservation = Reservation.new(reservation_params)
  @reservation.price = @reservation.sum_of_price  # reservationのpriceに変数として追加
  if @reservation.save!
   flash[:notice] = "予約を確定しました"
   redirect_to room_reservation_path(@reservation.room_id, @reservation.id) # 予約後確認ページへとぶ、idを渡したい順番を前から順に指定する
  else
   render "new"
  end
 end

 def destroy
 end

  private
  def reservation_params # ストロングパラメータ設定
params.require(:reservation).permit(:id, :finished_day, :started_day, :people, :price).merge(member_id: current_member.id, room_id: params[:room_id])
  end
end
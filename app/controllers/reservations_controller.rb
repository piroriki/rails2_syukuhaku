class ReservationsController < ApplicationController
# member.idは現在ログイン中のユーザーのみに絞り、reservation.idはログイン中のユーザー関連のidのみで絞り込む

 def index
  @reservations = Reservation.where(member_id: current_member.id)
 end

 def show
  @reservation = Reservation.find(params[:id])
 end

 def new
  @room = Room.find(params[:reservation][:room_id])
  @reservation = Reservation.new(reservation_params)
 end

 def create
  @room = Room.find(params[:reservation][:room_id])
  @reservation = Reservation.new(reservation_params)
  
  @price = @room.price * @reservation.people * (@reservation.finished_day - @reservation.started_day).to_i  # 合計金額計算
  @days = (@reservation.finishe_day - @reservation.started_day).to_i  # 宿泊日数計算
 
binding.pry
  if @reservation.save!
   flesh[:notice] = "予約を確定しました"
   redirect_to :reservation_path
  else
binding.pry
   render "new"
  end
 end

 def destroy
 end

  private
  def reservation_params
   params.require(:reservation).permit(:id, :finished_day, :started_day, :people).merge(member_id: current_member.id, room_id: params[:room_id])
  end
 end
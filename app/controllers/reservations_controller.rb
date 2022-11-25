class ReservationsController < ApplicationController
# member.idは現在ログイン中のユーザーのみに絞り、reservation.idはログイン中のユーザー関連のidのみで絞り込む

 def index
  @members = Member.all.includes(:rooms)
  @members = Member.find(current_member.id)
  @room = Room.find(params[:room_id])
  @reservations = Reservation.find(params[:id])
 end

 def show
  @member = Member.find(current_member.id)
  @reservation = Reservation.find(params[:id])
 end

 def new
  @member = Member.find(current_member.id)
  @room = Room.find(params[:reservation][:room_id])
  @reservation = Reservation.new
  @price = @room.price * @reservation.people * (@reservation.finished_day - @reservation.started_day).to_i # 合計金額計算
  @days = (@reservation.finishe_day - @reservation.started_day).to_i  # 宿泊日数計算
 
 end

 def create
  @reservation = Reservation.new(reservation_params)
binding.pry
  if @reservation.save!
   redirect_to :reservations
  else
binding.pry
   render "new"
  end
 end

 def edit
 end

 def update
  @room = Room.find(params[:id])
  @member =Member.find(params[:id])
  @reservations = Reservation.find(params[:id])
 end

 def destroy
 end

 private
  def reservation_params
   params.require(:reservation).permit(:id, :price, :finished_day, :started_day, :people).merge(:room_id, :member_id)
  end
 end
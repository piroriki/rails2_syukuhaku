class ReservationsController < ApplicationController
# member.idは現在ログイン中のユーザーのみに絞り、reservation.idはログイン中のユーザー関連のidのみで絞り込む

 def index
  @members = Member.all.includes(:rooms)
  @members = Member.find(current_member.id)
  @reservations = Reservations.all
 end

 def show
  @member = Member.find(current_member.id)
  @reservation = Reservation.find(params[:id])
 end

 def new
  @member = Member.find(params[:reservation][:room_id])
  @reservation = Reservation.new
binding.pry
  @price = @room.price * @reservation.people * (@reservation.finished_day - @reservation.started_day).to_i
  @days = (@reservation.finishe_day - @reservation.started_day).to_i  

 end

 def create
  @reservation = Reservation.new(params.require(:reservation).permit(:id, :reserve_image, :name, :introduction, :price, :finished_day, :started_day, :people, :room_id, :member_id))
  @reservation.room_id = Room.find(params[:id])
  if @reservation.save
   redirect_to :reservations
  else
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

end

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
  @member = Member.find(current_member.id)
　@reservation = Reservation.new
 end

 def create
  @reservation = Reservation.new(params.require(:room).permit(:id, :image, :name, :introduction, :price, :finished_day))
  if @reservation.save
   redirect_to :reservations
  else
   render "new"
  end
 end

 def edit
 end

 def update
 end

 def destroy
 end

end

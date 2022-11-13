class ReservationsController < ApplicationController
# user.idは現在ログイン中のユーザーのみに絞り、reservation.idはログイン中のユーザー関連のidのみで絞り込む

 def index
  @user = User.all
  @user = User.find(current_user.id)
  @reservation = Reservations.all
 end

 def show
  @user = User.find(current_user.id)
  @reservation = Reservation.find(params[:id])
 end

 def new
  @user = User.find(current_user.id)
　@reservation = Reservation.new
 end

 def create
  @reservation = Reservation.new(params.require(:room).permit(:id, :name, :introduction, :price, :image))
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

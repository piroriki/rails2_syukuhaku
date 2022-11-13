class RoomsController < ApplicationController
# user.idは現在ログイン中のユーザーのみで絞り、room.idはログイン中に使用されている関連idのみで絞り込む

 def index
  @user = User.all
  @user = User.find(current_user.id)
  @rooms = Room.all
 end

 def new
  @user = User.find(current_user.id)
  @room = Room.new
 end
 
 def create
  @room = Room.new(params.require(:room).permit(:id, :name, :introduction, :price, :image))
  if @room.save
   redirect_to :rooms
  else
   render "new"
  end
 end

 def show
  @user = User.find(current_user.id)
  @room = Room.find(params[:id])
 end

 def edit
 end

 def update
 end

 def destroy
 end

 def posts
  @user = User.all
  @user = User.find(current_user.id)
  @rooms = Room.all
 end

end

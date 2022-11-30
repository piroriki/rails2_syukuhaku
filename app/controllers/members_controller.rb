class MembersController < ApplicationController
 
 def show
  @member = current_member
 end

 def edit
  @member = current_member
 end

 def update
  @member = current_member
  @a = false
  if @member.update(member_params)
   @a = true
   flash[:notice] = "プロフィールを更新しました"
   redirect_to edit_member_path
  else
   flash[:notice] = "プロフィールを更新できませんでした"
   render "edit"
  end
 end

 private
 def member_params
  params.require(:member).permit(:name, :email, :introduction, :avatar)
 end

end

class ProfilesController < ApplicationController
  before_action :set_member, only: %i[edit update]

  def show;end

  def edit;end

  def update
    if @member.update(member_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: Member.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Member.model_name.human)
      render :edit
    end
  end

  private

  def set_member
    @member = Member.find(current_member.id)
  end

  def member_params
    params.require(:user).permit(:email, :name, :avatar, :introduction)
  end
end
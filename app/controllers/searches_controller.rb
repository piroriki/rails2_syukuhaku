class SearchesController < ApplicationController
 before_action :authenticate_member!

 def search
  @rooms = Room.looks(params[:search],params[:word])
 end
end

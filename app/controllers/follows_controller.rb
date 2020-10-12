class FollowsController < ApplicationController
  def new
    @follow = Follow.new
    @follows = Follow.where(user_id: current_user.id)
    @friend_user = User.find(params[:user_id])
    @friend_lists = List.where(user_id: params[:user_id]).where(public_id: 2)
  end

  def create
    @friend_user = User.find(params[:follow][:friend_id])
    @friend_lists = List.where(user_id: params[:follow][:friend_id]).where(public_id: 2)
    @follow = Follow.new(follow_params)
    if @follow.save
      redirect_to new_follow_path(user_id: params[:follow][:friend_id])
    else
      render :new
    end
  end

  private

  def follow_params
    params.require(:follow).permit(:user_id, :friend_id)
  end
end

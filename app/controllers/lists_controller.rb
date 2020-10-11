class ListsController < ApplicationController

  def new
    @list = List.new
    @lists = List.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @follows = Follow.where(user_id: current_user.id)
  end

  def create
    @list = List.new(list_params)
    @lists = List.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @follows = Follow.where(user_id: current_user.id)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @lists = List.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @follows = Follow.where(user_id: current_user.id)
    @list = List.find(params[:id])
  end

  def update
    @lists = List.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @follows = Follow.where(user_id: current_user.id)
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_animes_path(list_id: @list.id, anchor: "#{@list.id}-position")
    else
      render :edit
    end
  end

  def destroy
      list = List.find(params[:id])
      list.destroy
      redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :public_id).merge(user_id: current_user.id)
  end

end

class AnimesController < ApplicationController
  def index
    @lists = List.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @follows = Follow.where(user_id: current_user.id)
  end

  def new
    @list = List.find(params[:list_id])
    @anime = Anime.new
  end

  def create
    @list = List.find(params[:list_id])
    @anime = Anime.new(params_anime)
    if @anime.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @lists = List.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @friend_user = User.find_by(public_uid: params[:public_uid])
    @follows = Follow.where(user_id: current_user.id)
  end

  private

  def params_anime
    params.require(:anime).permit(:name, :genre_id, :score, :memo, :image).merge(list_id: params[:list_id])
  end

end
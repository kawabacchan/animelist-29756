class AnimesController < ApplicationController
  before_action :set_list, only: [:new, :create, :show, :edit, :update]
  before_action :set_lists, only: [:index, :search]
  before_action :set_anime, only: [:show, :edit, :update]
  before_action :set_user, only: [:index, :search]
  before_action :set_follows, only: [:index, :search]

  def index
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(params_anime)
    if @anime.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @anime.update(params_anime)
      redirect_to list_anime_path(list_id: params[:list_id])
    else
      render :edit
    end
  end

  def destroy
    anime = Anime.find(params[:id])
    if anime.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @friend_user = User.find_by(public_uid: params[:public_uid])
  end

  private

  def params_anime
    params.require(:anime).permit(:name, :genre_id, :score, :memo, :image).merge(list_id: params[:list_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_lists
    @lists = List.where(user_id: current_user.id)
  end

  def set_anime
    @anime = Anime.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_follows
    @follows = Follow.where(user_id: current_user.id)
  end
end

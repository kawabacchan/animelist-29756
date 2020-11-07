class ListsController < ApplicationController
  before_action :set_lists, only: [:new, :create, :edit, :update, :search]
  before_action :set_user, only: [:new, :create, :edit, :update, :search]
  before_action :set_follows, only: [:new, :create, :edit, :update, :search]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
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

  def search
    @year = params[:year]
    uri = URI.parse("http://api.moemoe.tokyo/anime/v1/master/#{@year}")
    response = Net::HTTP.get_response(uri)
    results = JSON.parse(response.body)
    @broadcast_animes = []
    results.each do |result|
      @broadcast_animes << result["title"]
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :public_id).merge(user_id: current_user.id)
  end

  def set_lists
    @lists = List.where(user_id: current_user.id)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_follows
    @follows = Follow.where(user_id: current_user.id)
  end
end

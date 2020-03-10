class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  
  def index
    @games = Game.all
  end
  
  def create
    @game = current_user.games.create(game_params)
    if @game.errors.any?
      set_categories
      render 'new'
    else 
      redirect_to games_path
    end 
  end 

  def new
    @game = Game.new 

  end 

  def show 
    
  end 

  def update 
    @game = current_user.games.find(params[:id])
    @game.update(game_params)
    
    if @game.errors.any?
      set_categories 
      render 'edit'
    else 
      redirect_to games_path
    end
  end 

  def edit 

  end 

  def destroy 

  end 

  private 

  def set_game
    begin 
    id = params[:id]
    @game = Game.find(id)
    rescue ActiveRecord::RecordNotFound
    redirect_to not_found_path, :flash => { :alert => "The game you're looking for doesn't exist" }
    end 
  
  end

  def game_params
    params.require(:game).permit(:title, :description, :location, :category_id, :capacity)
  end 
 
  def set_categories
    @categories = Category.all
  end 

  def set_users_game

  end 

  def authorize_user 
    if @game.listing.user_id != current_user.id
      redirect_to listings_path
    end
  end 

end



class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :destroy, :favorite]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:new, :edit]

  
  def index
    @games = Game.all
  end
  
  def create
    @game = current_user.games.create(game_params)
    if @game.errors.any?
      set_categories
      render 'new', :flash => { :alert => @game.errors.full_messages.to_sentence }
    else 
      redirect_to games_path
    end 
  end 

  def new
    @game = Game.new 

  end 

  def show 
    
  end 

  def favorite
    type = params[:type]
    case type 
    when "favorite"
      current_user.favorites << @game
      redirect_back(fallback_location: root_path, :flash => {:notice => "Favorited #{@game.title}"})
    

    when "unfavorite"
      current_user.favorites.delete(@game)
      redirect_back(fallback_location: root_path, :flash => {:notice => "Unfavorited #{@game.title}"})

    else
      # Type missing, nothing happens
      redirect_back(fallback_location: root_path, :flash => {:alert => "Something went Wrong"})
    end

  end 

  def update 
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
    @game.delete
    redirect_to games_path, :flash => { notice: "Deleted"}
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



  def authorize_user
    @game = current_user.games.find(params[:id]) 
    if @game.user_id != current_user.id
      redirect_back(fallback_location: root_path, :flash => {:alert => "I don't think so cheif"})
    end
  end 

  def check_user
    if !current_user
      redirect_back(fallback_location: root_path, :flash => {:alert => "You need to be logged in to do that"})
    end
  end 

end



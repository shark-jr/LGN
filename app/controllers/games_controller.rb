class GamesController < ApplicationController

  include GamesHelper

  def show
    @games = []
    @hot_games = GamesHelper.hot_games
    @hot_games.each do |game|
      @game = Game.find_or_create_by(title: game[:name])
      unless @game.image
        @game.image = game[:url]
        @game.save
      end
      @games << @game
    end
    @games
  end

  def add_to_user
    @games_user = GamesUser.create(game_id: params[:game_id].to_i, user_id: current_user[:id])
    @games_user.save
    redirect_to games_path
  end

  private
    def games_user_params
      params.require(:games_user).permit(:game_id)
    end

end

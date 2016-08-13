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
    # @games = Game.all
    # game_id = params.keys.map do | key |
    #   if key.include?("gameId")
    #     params[key]
    #   end
    # end
    # byebug
    @games_user = GamesUser.create(game_id: params[:game_id].to_i, user_id: current_user[:id])
    @games_user.save
    # @game = Game.find_or_create_by(title: params[:name])
    redirect_to games_path
  end

    # def search # get
    # end
    #
    # def search_handler #post
    #   @search_results = SearchAPI.results(params)
    #   render "show_results"
    # end
    #
    # def show_results
    #   @search_results
    # end

  private
    def games_user_params
      params.require(:games_user).permit(:game_id)
    end

end

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
    # @game = Game.find_or_create_by(title: params[:game][:name])
    @game = Game.find_or_create_by(title: params[:name])
    render action: :show
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

end

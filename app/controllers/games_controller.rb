class GamesController < ApplicationController

  include GamesHelper

  def show
    @hot_games = GamesHelper.hot_games
  end

  def add_to_user
    
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

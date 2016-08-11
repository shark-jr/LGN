require 'httparty'
require 'json'

module GamesHelper
  # puts list of search result urls
  def self.hot_games

    response = HTTParty.get("https://api.twitch.tv/kraken/games/top?limit=100")
    body = JSON.parse(response.body)

    top_games = body["top"]

    twitch_list = top_games.map do |game|
                  {name: game["game"]["name"],
                  url: game["game"]["box"]["large"]}
                end

    shit_list = ["Gaming Talk Shows",
                "Poker",
                "Creative",
                "Pictionary",
                "Gal Gun: Double Peace",
                "Music",
                "Draw Something",
                "Retro",
                "This Is the Police",
                "Social Eating",
                "Casino",
                "Twitch",
                "Twitch Plays",
                "Abzû",
                "Classroom Aquatic",
                "Winning Putt",
                "Doorways: Holy Mountains of Flesh",
                "Phantasmagoria: A Puzzle of Flesh",
                "Board Games",
                "Spider-Man and the X-Men: Arcade's Revenge",
                "Dragon Ball Z"]
    shit_list = shit_list.map do |item|
      item.downcase
    end

    # p shit_list
    game_list = twitch_list.map do |item|
      if not shit_list.include?(item[:name].downcase)
        item
      end
    end.compact
   game_list
 end
  end

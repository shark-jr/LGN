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
    shit_list = [
                "Abzû",
                "Music",
                "Poker",
                "Retro",
                "Shelter",
                "Creative",
                "Foul Play",
                "Pictionary",
                "Board Games",
                "MechWarrior",
                "BeamNG.Drive",
                "Casino Games",
                "Pokémon Dash",
                "Twitch Plays",
                "Winning Putt",
                "Dragon Ball Z",
                "Social Eating",
                "Games + Demos",
                "Draw Something",
                "FIFA Manager 13",
                "Worms Clan Wars",
                "Worms Armageddon",
                "Classroom Aquatic",
                "Gaming Talk Shows",
                "Super Smash Bros.",
                "This Is the Police",
                "Gal Gun: Double Peace",
                "Golf With Your Friends",
                "Worms: The Director's Cut",
                "Uncharted 2: Among Thieves",
                "Pokémon XD: Gale of Darkness",
                "Contradiction: Spot The Liar!",
                "The Elder Scrolls II: Daggerfall",
                "Tom Clancy's Rainbow 6: Patriots",
                "Doorways: Holy Mountains of Flesh",
                "Phantasmagoria: A Puzzle of Flesh",
                "Dungeon Nightmares II : The Memory",
                "Ostrich Island: Escape From Paradise",
                "Professor Layton and the Curious Village",
                "Spider-Man and the X-Men: Arcade's Revenge",
                "London 2012 - The Official Video Game of the Olympic Games"]
    shit_list = shit_list.map do |item|
      item.downcase
    end

    game_list = twitch_list.map do |item|
      if not shit_list.include?(item[:name].downcase)
        item
      end
    end.compact
   game_list
 end

end

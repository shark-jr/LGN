require 'httparty'
require 'json'


response = HTTParty.get("https://api.twitch.tv/kraken/games/top?limit=100")
body = JSON.parse(response.body)

top_games = body["top"]

# p top_games[0]["game"]["name"]
# p top_games[0]["game"]["box"]["large"]
twitch_list = top_games.map do |game|
              {name: game["game"]["name"],
              url: game["game"]["box"]["large"]}
            end
# puts twitch_list


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
            "Twitch"]
shit_list = shit_list.map do |item|
  item.downcase
end

# p shit_list
game_list = twitch_list.map do |item|
  if not shit_list.include?(item[:name].downcase)
    item
  end
end.compact
puts game_list




















# def results(array)
#   games = []
#   i = 0
#   while i < array.length do
#     url = array[i]["webformatURL"].gsub("_640.jpg", "_960.jpg")
#     images << url
#     i += 1
#   end
#   images
# end

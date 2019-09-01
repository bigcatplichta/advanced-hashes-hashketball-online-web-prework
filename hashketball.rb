require 'pry'

def game_hash
  
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {"Alan Anderson" =>
         {:number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1}
        },
        {"Reggie Evans" => 
         {:number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7}
        },
        {"Brook Lopez" => 
         {:number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15}
        },
        {"Mason Plumlee" => 
         {:number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 11,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5}
        },
        {"Jason Terry" => 
         {:number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1}
        },
      ]  
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {"Jeff Adrien" =>
         {:number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2}
        },
        {"Bismack Biyombo" => 
         {:number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 22,
         :blocks => 15,
         :slam_dunks => 10}
        },
        {"DeSagna Diop" => 
         {:number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5}
        },
        {"Ben Gordon" => 
         {:number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0}
        },
        {"Kemba Walker" => 
         {:number => 33,
         :shoe => 15,
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 7,
         :blocks => 5,
         :slam_dunks => 12}
        },
      ]  
    }
  }
end

def num_points_scored(player)
  game_hash.each do | team, tm_info |
    tm_info.each do | key, player_list |
      if key == :players
        player_list.each do | name_hash |
          name_hash.each { | name, stats | return stats[:points] if name == player }
        end 
      end 
    end 
  end 
end

def shoe_size(player)
  game_hash.each do | team, tm_info |
    tm_info.each do | key, player_list |
      if key == :players
        player_list.each do | name_hash |
          name_hash.each { | name, stats | return stats[:shoe] if name == player }
        end 
      end 
    end 
  end 
end

def team_colors(team_name)
 color_array = []
  game_hash.each do | team, tm_info |
    if tm_info[:team_name] == team_name
      tm_info.each { | key, colors | color_array = colors if key == :colors }
    end
  end 
  color_array
end

def team_names
  team_array = []
  game_hash.each do | team, tm_info |
    team_array << tm_info[:team_name]
  end 
  team_array
end 

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do | team, tm_info |
    if tm_info[:team_name] == team_name
      tm_info.each do | key, player_list |
        if key == :players
          player_list.each do | name_hash |
            name_hash.each { | name, stats| jersey_numbers << stats[:number] }
          end
        end
      end
    end
  end
  jersey_numbers 
end

def player_stats(player_name)
  game_hash.each do | team, tm_info |
    tm_info.each do | key, player_list |
      if key == :players
        player_list.each do | name_hash |
          name_hash.each { | name, stats | return stats if name == player_name }
       end 
      end
    end
  end
end

def big_shoe_rebounds
  max_shoe = 0
  clown_rebounds = ""
  
  game_hash.each do | team, tm_info |
    tm_info.each do | key, player_list |
      if key == :players  
        player_list.each do | name_hash |
          name_hash.each do | name, stats |
            if stats[:shoe] > max_shoe
            max_shoe = stats[:shoe] 
            clown_rebounds = stats[:rebounds]
            # binding.pry
            end 
          end
        end 
      end 
    end
  end
  return clown_rebounds
end

def most_points_scored
  max_points = 0
  mvp = ""
  
  game_hash.each do | team, tm_info |
    tm_info.each do | key, player_list |
      if key == :players  
        player_list.each do | name_hash |
          name_hash.each do | name, stats |
            if stats[:points] > max_points
            max_shoe = stats[:shoe] 
            mvp = name
            end 
          end
        end 
      end 
    end
  end
  return mvp
end
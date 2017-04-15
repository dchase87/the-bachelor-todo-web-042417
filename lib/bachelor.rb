def get_first_name_of_season_winner(data, season)
  winner = []
  data.each do |season_number, season_data|
    if season == season_number
      season_data.each do |contestant_data|
        if contestant_data["status"] == "Winner"
          winner << contestant_data["name"].split(' ')
        end
      end
    end
  end
  winner[0][0]
end

def get_contestant_name(data, occupation)
  name = []
  data.each do |season_number, season_data|
    season_data.each do |contestant_data|
      if occupation == contestant_data["occupation"]
        name << contestant_data["name"]
      end
    end
  end
  name[0]
end

def count_contestants_by_hometown(data, hometown)
  count = []
  data.each do |season_number, season_data|
    season_data.each do |contestant_data|
      if hometown == contestant_data["hometown"]
        count << contestant_data["name"]
      end
    end
  end
  count.length
end

def get_occupation(data, hometown)
  first_occupation = []
  data.each do |season_number, season_data|
    season_data.find do |contestant_data|
      if hometown == contestant_data["hometown"]
        first_occupation << contestant_data["occupation"]
      end
    end
  end
  first_occupation[0]
end

def get_average_age_for_season(data, season)
  age_array = []
  data.each do |season_number, season_data|
    if season == season_number
      season_data.each do |contestant_data|
        age_array << contestant_data["age"].to_i
      end
    end
  end
  (age_array.inject do |sum, age|
    sum + age
  end.to_f / age_array.size).round
end

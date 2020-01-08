require 'pry'
contestants = JSON.parse(File.read('spec/fixtures/contestants.json'))

def get_first_name_of_season_winner(data, season)
  data.each do |season_number, contestant_data|
    if season == season_number
      contestant_data.each do |attribute|
        if attribute["status"] == "Winner"
          winner_name = attribute["name"].split 
          return winner_name[0]
        end
      end  
    end
  end
end


def get_contestant_name(data, occupation)
  data.each do |season_number, contestant_data| 
    contestant_data.each do |attribute| 
      if attribute["occupation"] == occupation
        return attribute["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_number, contestant_data| 
    contestant_data.each do |attribute|
      if attribute["hometown"] == hometown
        counter += 1 
      end
    end
  end
return counter 
end

def get_occupation(data, hometown)
  # takes in the data and the string of the hometown 
  #returns the occupation of the first contestant from there 
  data.each do |season_number, contestant_data| 
    contestant_data.each do |attribute|
      if attribute["hometown"] == hometown
        return attribute["occupation"]
      end
    end
  end
end


def get_average_age_for_season(data, season)
  # iterate over hash and get the average age of contestants for that season
  contestant_ages = []
  data.each do |season_number, contestant_data|
    if season == season_number
      contestant_data.each do |attribute|
        contestant_ages << attribute["age"].to_f
      end
    end
  end
return (contestant_ages.sum/contestant_ages.length).round
end


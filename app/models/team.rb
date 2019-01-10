class Team < ApplicationRecord
  has_many :home_games, foreign_key: 'home_id', class_name: 'Game'
  has_many :visitor_games, foreign_key: 'visitor_id', class_name: 'Game'
end

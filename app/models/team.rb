class Team < ActiveRecord::Base
  attr_accessible :at_bat, :hits, :inning, :on_base, :outfielders, :outs, :pitchers_faced, :runs, :trade_players,:name
include Redis::Objects

  lock :trade_players, :expiration => 15  # sec
  counter :hits
  counter :runs
  counter :outs
  counter :inning, :start => 1
  list :on_base
  set :outfielders
  value :at_bat
  hash_key :pitchers_faced  # "hash" is taken by Ruby

end

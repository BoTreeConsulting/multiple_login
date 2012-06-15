class Team < ActiveRecord::Base
  attr_accessible :at_bat, :hits, :inning, :on_base, :outfielders, :outs, :pitchers_faced, :runs, :trade_players
end

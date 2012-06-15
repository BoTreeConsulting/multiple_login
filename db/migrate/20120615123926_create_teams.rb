class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :trade_players
      t.integer :hits
      t.integer :runs
      t.integer :outs
      t.integer :inning
      t.string :on_base
      t.string :outfielders
      t.string :at_bat
      t.string :pitchers_faced

      t.timestamps
    end
  end
end

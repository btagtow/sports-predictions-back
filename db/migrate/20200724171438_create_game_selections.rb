class CreateGameSelections < ActiveRecord::Migration[6.0]
  def change
    create_table :game_selections do |t|
      t.string :dateEvent
      t.string :idAwayTeam
      t.string :idEvent
      t.string :idHomeTeam
      t.string :idLeague
      t.string :strAwayTeam
      t.string :strEvent
      t.string :strEventAlternate
      t.string :strHomeTeam
      t.string :strLeague
      t.string :strSeason
      t.string :strSport
      t.string :strTime
      t.string :correctSelection
      t.string :selectedWinnerId
      t.string :selectedWinnerString

      t.timestamps
    end
  end
end

class AddUserIdToGameSelections < ActiveRecord::Migration[6.0]
  def change
    add_reference :game_selections, :user, null: false, foreign_key: true
  end
end

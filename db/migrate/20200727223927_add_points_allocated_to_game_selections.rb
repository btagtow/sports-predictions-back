class AddPointsAllocatedToGameSelections < ActiveRecord::Migration[6.0]
  def change
    add_column :game_selections, :points_allocated, :integer
  end
end

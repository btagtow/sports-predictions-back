class AddBettingPointsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :betting_points, :integer
  end
end

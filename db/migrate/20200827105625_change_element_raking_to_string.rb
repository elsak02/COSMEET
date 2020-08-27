class ChangeElementRakingToString < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :element_ranking, :string, array: true
    change_column :users, :mode_ranking, :string, array: true
  end
end

class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birth_date, :date
    add_column :users, :birth_time, :time
    add_column :users, :birth_place, :string
    add_column :users, :gender, :string
    add_column :users, :sexual_preference, :string
    add_column :users, :relationship_type, :string
    add_column :users, :element_ranking, :integer, array: true
    add_column :users, :mode_ranking, :integer, array: true
  end
end

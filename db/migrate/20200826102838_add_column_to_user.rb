class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :personality_trait, :string
  end
end

class AddColumnToCompatibility < ActiveRecord::Migration[6.0]
  def change
    add_reference :compatibilities, :user, null: false, foreign_key: true
    add_column :compatibilities, :compatibility_description, :text
    add_column :compatibilities, :compatibility_score, :integer
  end
end

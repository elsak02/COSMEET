class AddColumnToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :liked, :boolean
  end
end

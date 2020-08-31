class AddColumnToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :compatibility_description, :text
  end
end

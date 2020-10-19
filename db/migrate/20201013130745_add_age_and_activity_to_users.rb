class AddAgeAndActivityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age_preference, :integer
    add_column :users, :activities, :string
  end
end

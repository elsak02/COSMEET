class ChangeAgeAndActivityToArray < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :age_preference, :integer, array: true, default: [], using: "ARRAY[age_preference]::INTEGER[]"
    change_column :users, :activities, :string, array: true, default: [], using: "(string_to_array(activities, ','))"
  end
end

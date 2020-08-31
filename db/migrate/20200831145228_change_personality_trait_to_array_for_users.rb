class ChangePersonalityTraitToArrayForUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :personality_trait, :string, array: true, default: [], using: "(string_to_array(personality_trait, ','))"
    rename_column :users, :personality_trait, :personality_traits
  end
end

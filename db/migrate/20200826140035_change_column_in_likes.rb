class ChangeColumnInLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference(:likes, :receiver, foreign_key: {to_table: :users})
  end
end

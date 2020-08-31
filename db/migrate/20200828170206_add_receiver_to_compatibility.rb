class AddReceiverToCompatibility < ActiveRecord::Migration[6.0]
  def change
    add_reference(:compatibilities, :receiver, foreign_key: {to_table: :users})
  end
end

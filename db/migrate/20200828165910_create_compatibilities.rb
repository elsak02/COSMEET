class CreateCompatibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :compatibilities do |t|

      t.timestamps
    end
  end
end

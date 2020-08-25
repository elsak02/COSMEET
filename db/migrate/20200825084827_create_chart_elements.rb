class CreateChartElements < ActiveRecord::Migration[6.0]
  def change
    create_table :chart_elements do |t|
      t.string :planet
      t.string :sign
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

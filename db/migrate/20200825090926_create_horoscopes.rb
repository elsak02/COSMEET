class CreateHoroscopes < ActiveRecord::Migration[6.0]
  def change
    create_table :horoscopes do |t|
      t.date :date
      t.string :sign
      t.text :content

      t.timestamps
    end
  end
end

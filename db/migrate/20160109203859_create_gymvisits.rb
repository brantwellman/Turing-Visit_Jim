class CreateGymvisits < ActiveRecord::Migration
  def change
    create_table :gymvisits do |t|
      t.string :date
      t.integer :calories_burned
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

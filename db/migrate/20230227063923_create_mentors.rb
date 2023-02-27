class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bio
      t.string :field
      t.string :country
      t.string :experience
      t.integer :price_per_hour

      t.timestamps
    end
  end
end

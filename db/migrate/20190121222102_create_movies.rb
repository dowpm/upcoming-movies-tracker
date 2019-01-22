class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :user_id
      t.string :name
      t.string :director
      t.date :release_date
      t.string :summary

      t.timestamps
    end
  end
end

class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.boolean :released
      t.integer :rrelease_year
      t.string :artist_name
      t.string :genre

      t.timestamps
    end
  end
end

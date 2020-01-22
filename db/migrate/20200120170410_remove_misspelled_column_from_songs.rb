class RemoveMisspelledColumnFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :rrelease_year, :integer
  end
end

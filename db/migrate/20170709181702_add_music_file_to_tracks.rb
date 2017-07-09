class AddMusicFileToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :music_file, :string
  end
end

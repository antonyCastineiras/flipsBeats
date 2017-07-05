class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.decimal :price
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end

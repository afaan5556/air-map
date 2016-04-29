class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :airmap_id
      t.string :children
      t.string :sport
      t.string :health
      t.string :inside
      t.string :outside
      t.string :main
      t.string :effects
      t.string :causes
      t.string :dominant_pollutant_description
    end
  end
end

class CreateAirQuals < ActiveRecord::Migration
  def change
    create_table :air_quals do |t|
      t.integer :user_id
      t.string :address
      t.text :report

      t.timestamps
    end
  end
end

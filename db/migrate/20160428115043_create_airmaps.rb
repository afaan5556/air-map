class CreateAirmaps < ActiveRecord::Migration
  def change
    create_table :airmaps do |t|
      t.integer :user_id
      t.string :address
      t.float :lat
      t.float :lon
      t.text :report

      t.timestamps
    end
  end
end

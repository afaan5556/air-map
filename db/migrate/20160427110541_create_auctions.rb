class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.datetime :start
      t.datetime :stop
      t.float :price

      t.timestamps
    end
  end
end

class CreateDesks < ActiveRecord::Migration[5.1]
  def change
    create_table :desks do |t|
      t.string :model
      t.integer :owner_id

      t.timestamps
    end
  end
end

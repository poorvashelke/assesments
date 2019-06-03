class CreateCommittees < ActiveRecord::Migration[5.1]
  def change
    create_table :committees do |t|
      t.string :name
      t.string :mandate
      t.integer :chairperson_id

      t.timestamps
    end
  end
end

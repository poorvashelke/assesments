class CreateBillEndorsements < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_endorsements do |t|
      t.integer :bill_id
      t.integer :senator_id

      t.timestamps
    end
  end
end

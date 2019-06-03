class CreateCommitteeMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :committee_memberships do |t|
      t.integer :senator_id
      t.integer :committee_id

      t.timestamps
    end
  end
end

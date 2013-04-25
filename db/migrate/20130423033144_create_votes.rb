class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :vote_type
      t.integer :voter_id
      t.references :tutorial

      t.timestamps
    end
  end
end

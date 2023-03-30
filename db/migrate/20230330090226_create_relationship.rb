class CreateRelationship < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end

    change_column_null :relationships, :follower_id, true
    change_column_null :relationships, :following_id, true
    add_index :relationships, :follower_id
    add_index :relationships, :following_id
  end
end


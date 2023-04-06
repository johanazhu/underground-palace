class CreateTag1s < ActiveRecord::Migration[7.0]
  def change
    create_table :tag1s do |t|
      t.string :name

      t.timestamps
    end
  end
end

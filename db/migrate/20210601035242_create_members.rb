class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer :bandmate_id
      t.integer :duet_id
      t.integer :instrumnet_id
      t.boolean :open

      t.timestamps
    end
  end
end

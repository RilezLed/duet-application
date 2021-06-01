class CreateDuets < ActiveRecord::Migration[6.0]
  def change
    create_table :duets do |t|
      t.integer :creator_id
      t.integer :song_id
      t.boolean :private
      t.boolean :looking

      t.timestamps
    end
  end
end

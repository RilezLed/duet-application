class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :requestor_id
      t.integer :group_id
      t.integer :instrument_id
      t.string :status

      t.timestamps
    end
  end
end

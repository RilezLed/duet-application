class RenameMemebersColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :members, :instrumnet_id, :instrument_id
  end
end

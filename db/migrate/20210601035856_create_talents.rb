class CreateTalents < ActiveRecord::Migration[6.0]
  def change
    create_table :talents do |t|
      t.integer :musician_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end

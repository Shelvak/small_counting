class CreateFlowsCounts < ActiveRecord::Migration
  def change
    create_table :flows_counts do |t|
      t.decimal :out, precision: 15, scale: 2, default: 0.0
      t.decimal :in, precision: 15, scale: 2, default: 0.0
      t.decimal :total, precision: 15, scale: 2, default: 0.0

      t.timestamps
    end
  end
end

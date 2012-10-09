class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :description, null: false
      t.decimal :amount, precision: 15, scale: 2, null: false
      t.boolean :earn, null: false, default: false

      t.timestamps
    end
  end
end

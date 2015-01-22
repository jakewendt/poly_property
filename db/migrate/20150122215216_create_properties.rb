class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :widget, index: true
      t.string :key, index: true
      t.string :value

      t.timestamps null: false
    end
    add_foreign_key :properties, :widgets
  end
end

class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :cuit, null: false
      t.boolean :legal, null: false
      t.timestamps null: false
    end
  end
end

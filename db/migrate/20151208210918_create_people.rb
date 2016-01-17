class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :cuit, null: false, limit: 8
      t.integer :legal, null: false
      t.timestamps null: false
    end
  end
end

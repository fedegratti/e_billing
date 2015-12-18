class CreateClient < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthday
      t.boolean :gender, null: false
      t.integer :dni, null: false
      t.integer :cuit, null: false, :limit => 8
      t.string :email, null: false
      t.string :address
      t.integer :telephone
      t.string :skype
      t.string :facebook
      t.integer :bills_issued
      t.timestamps null: false
    end
  end
end

class CreateBill < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.belongs_to :client, index: true
      t.belongs_to :person, index: true
      t.string :description, null: false
      t.decimal :total_amount, :precision => 8, :scale => 2
      t.date :issue_date, null:false
      t.timestamps null: false
    end
  end
end

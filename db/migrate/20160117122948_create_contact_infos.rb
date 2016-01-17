class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.belongs_to :client, index: true
      t.string :name
      t.string :value

      t.timestamps null: false
    end
  end
end

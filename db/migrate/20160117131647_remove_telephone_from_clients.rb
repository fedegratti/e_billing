class RemoveTelephoneFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :telephone, :string
  end
end

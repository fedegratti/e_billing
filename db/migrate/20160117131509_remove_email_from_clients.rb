class RemoveEmailFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :email, :string
  end
end

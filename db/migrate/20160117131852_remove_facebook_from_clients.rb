class RemoveFacebookFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :facebook, :string
  end
end

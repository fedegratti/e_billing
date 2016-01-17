class RemoveSkypeFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :skype, :string
  end
end

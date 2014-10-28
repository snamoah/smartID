class RemoveCredentialnameFromCredential < ActiveRecord::Migration
  def change
    remove_column :credentials, :credentialname, :string
  end
end

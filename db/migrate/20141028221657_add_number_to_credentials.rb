class AddNumberToCredentials < ActiveRecord::Migration
  def change
    add_column :credentials, :number, :string
  end
end

class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :name
      t.string :credentialname
      t.string :Picture

      t.timestamps
    end
  end
end

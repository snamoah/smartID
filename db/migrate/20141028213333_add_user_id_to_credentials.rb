class AddUserIdToCredentials < ActiveRecord::Migration
  def change
    add_reference :credentials, :user, index: true
  end
end

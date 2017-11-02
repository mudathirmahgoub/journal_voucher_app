class AddTokenExpirationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token_created, :datetime
    add_column :users, :token_last_used, :datetime

    #update indexes
    remove_index :users, :token
    add_index :users, [:token, :token_created, :token_last_used]
  end
end

class Companies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone_number
      t.datetime :start_date
      t.string :default_currency
      t.timestamps
    end
  end
end

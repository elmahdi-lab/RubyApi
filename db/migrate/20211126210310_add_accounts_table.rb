class AddAccountsTable < ActiveRecord::Migration[6.1]
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end

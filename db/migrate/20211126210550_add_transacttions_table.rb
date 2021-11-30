class AddTransacttionsTable < ActiveRecord::Migration[6.1]
  def self.up
    create_table :transactions do |t|
      t.string :description
      t.decimal :amount, default: 0, scale: 2, precision: 10
      t.belongs_to :bank, index: true, foreign_key: true
      t.belongs_to :account, index: true, foreign_key: true
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end

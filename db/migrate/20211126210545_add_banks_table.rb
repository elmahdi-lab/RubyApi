class AddBanksTable < ActiveRecord::Migration[6.1]
  def self.up
    create_table :banks do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :banks
  end
end

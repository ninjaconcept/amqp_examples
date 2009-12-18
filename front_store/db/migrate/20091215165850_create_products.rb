class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :products
  end
end
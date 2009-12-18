class CreateOrderProducts < ActiveRecord::Migration
  def self.up
    create_table :order_products do |t|
      t.column :order_id, :integer, :null => false
      t.column :product_id, :integer, :null => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :order_products
  end
end
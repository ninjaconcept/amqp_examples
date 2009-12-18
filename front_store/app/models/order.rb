class Order < ActiveRecord::Base
  has_many :products, :through => :order_products
  has_many :order_products
  
  after_save :enqueue
  
  def to_hash
    self.attributes.merge({ :products => self.products })
  end
  
  def enqueue
    Warren::Queue.publish(:default, self.to_hash)
  end
  
end
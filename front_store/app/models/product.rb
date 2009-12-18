class Product < ActiveRecord::Base
  
  belongs_to :order_product
  
  def price=(value)
    self['price'] = value.to_f*100
  end
  
  def price
    self['price'].to_f/100
  end
  
end
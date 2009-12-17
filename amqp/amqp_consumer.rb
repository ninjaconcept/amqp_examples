require 'rubygems'
require 'amqp'
require 'mq'
 
AMQP.start(:host => 'localhost') do
  
  def log *args
    p [ Time.now, *args ]
  end

  def watch_appl_stock
    mq = MQ.new
    mq.queue('apple stock').bind(mq.topic('stocks'), :key => 'usd.appl').subscribe{ |price|
      log 'apple stock', price
    }
  end
  
  watch_appl_stock

end
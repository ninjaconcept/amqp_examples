require "rubygems"
require "warren"
require "warren/adapters/bunny_adapter"

Signal.trap("INT") { exit! }
Signal.trap("TERM") { exit! }

# Listen to the main queue
q = "main"
puts "Listening to the #{q} queue."

# Setup our own connection before generating the queue object
conn = Warren::Connection.new("development" => {
  :user => "guest",
  :pass => "guest",
  :vhost => "/",
  :default_queue => "main",
  :logging => false
})
# Set the connection for the queue
Warren::Queue.connection = conn

# And attach a block for new messages to fire
Warren::Queue.subscribe(q) do |msg|
  p [Time.now, msg]
end

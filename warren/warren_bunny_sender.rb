require "rubygems"
require "warren"
require "warren/adapters/bunny_adapter"

Signal.trap("INT") { exit! }
Signal.trap("TERM") { exit! }

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
# Generate some data to send
data = {
  :people => [
    :fred => {
      :age => 25,
      :location => "Leeds"
    },
    :george => {
      :age => 32,
      :location => "London"
    }
  ]
}

# Push a message onto the queue
p Warren::Queue.publish(:default, data )

# And then push a message onto the queue, returning "foo"
#p Warren::Queue.publish(:default, data) { "foo" }

module Connections
  # hashmap : can be persisted
  attr_accessor :connections
  
  def connection_missing(id, *args)
    set(:connections, $1, *args) if /connect_to_(.+)/.match(id.to_s)
    set(:connections, $1, *args) if /disconnect_from_(.+)/.match(id.to_s)
  end
end  

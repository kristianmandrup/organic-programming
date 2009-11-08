# depends what organism consists of
module View
  def to_s
    %Q{
      skeleton    : #{@skeleton.inspect}
      connections : #{@connections.inspect}
    }      
  end
end

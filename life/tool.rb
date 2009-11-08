module Tools
  # hashmap : usually not persisted
  attr_accessor :tools
    
  def tool_missing(id, *args)
    set(:tools, $1, *args) if /grab_(.+)/.match(id.to_s)
    get(:tools, $1, *args) if /drop(.+)/.match(id.to_s)
  end
  
  def add_tool(clazz)
    if clazz.kind_of? Tool
      self.mixin clazz 
    else
      raise NotATool, "not a tool"
    end
  end
  
end

module Tool
end
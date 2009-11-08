module Infrastructure
  @children = []  
  class << self
    attr_reader :children
    def extended(child)
      @children << child
    end
  end
end
class MuscleRegistry
  include Singleton
  
  attr_accessor :muscles

  def initialize
    @muscles ||= {}
  end
  
  def muscle(id)
    muscles[id.to_sym]    
  end

  def muscle=(id, muscle)
    muscles[id.to_sym] = muscle    
  end

  def add_muscles(hash)
    muscles.merge!(hash)
  end

end
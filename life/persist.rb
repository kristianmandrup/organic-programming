# take the state of skeleton and persist of subset of it (depending on contexts and roles)
# TODO
module Persist  
  include FilterMapper

  def load(id)
    {}        
  end
  
  def marshal
    persist_filter = get_filter(contexts, roles)
    persist_filter.apply_on skeleton
  end
  
  def unmarshal(id)
    obj = load(id)     
    persist_filter = get_filter(contexts, roles)
    @skeleton = persist_filter.apply_on obj    
  end
  
end

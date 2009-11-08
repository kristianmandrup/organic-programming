module Limb
  def set(body_part, key, *args)
    sym_key = key.to_sym
    var = instance_variable_get("@#{body_part}") # if instance_variable_defined? body_part        
    return if !var
    if args.size > 1
      var[sym_key] = *args 
    else
      var[sym_key] = *args[0]
    end  
  end

  def get(body_part, key, *args)
    sym_key = key.to_sym
    var = instance_variable_get("@#{body_part}") # if instance_variable_defined? body_part
    puts instance_variables.inspect
    raise NotFoundException if !var
    return var[sym_key]
  end
end
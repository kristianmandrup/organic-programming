module PaintShop
  def self.paint(roles)
    "masterpiece"
  end
  
end

# require 'temp'

module_name = "PaintShop"
method_name = "paint"

if Object.const_defined?(module_name)
  required_module = Kernel.const_get(module_name)
  if required_module.respond_to?(method_name) then
    required_method = required_module.method(method_name)
    required_method.call('Alister')
  else
    puts "Invalid method '#{method_name}' for module '#{module_name}'"
  end
else
 puts "Invalid module '#{module_name}'"
end

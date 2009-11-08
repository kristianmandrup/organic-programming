require 'limb'

class Organic
  include Limb
  attr_accessor :method_missing_list
  attr_accessor :skeleton
  attr_accessor :config

  def initialize(options = {})
    @skeleton ||= options[:skeleton] || {}   
    @config ||= {}     
    add_muscles
    layers(options[:layers]) if options[:layers]
  end

  def layers(layer_options)
    add_tools if layer_options.include? :tools
    add_motors if layer_options.include? :motors
    add_brains if layer_options.include? :brains
    add_muscles if layer_options.include? :muscles
  end
  
  
  def add_tools
    self.mixin Tools
    @method_missing_list ||= []        
    @method_missing_list << Proc.new {|id, args| tool_missing id, args}    
  end

  def add_brains
    self.mixin Brains
    @method_missing_list ||= []    
    @method_missing_list << Proc.new {|id, args| brain_missing id, args}    
  end

  def add_motors
    self.mixin Motors
    @method_missing_list ||= []    
    @method_missing_list << Proc.new {|id, args| motor_missing id, args}    
  end

  def add_muscles
    self.mixin Muscles
    @method_missing_list ||= []    
    @method_missing_list << Proc.new {|id, args| muscle_missing id, args}    
  end

  def method_missing(id, *args)
    @method_missing_list.each do |mm|
      res = mm.call(id, args)
      return res if !res.nil?
    end
    nil
  end
end

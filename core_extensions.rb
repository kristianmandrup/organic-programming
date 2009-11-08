class Module
  def to_sym
    s = self.name.to_s.gsub!(/([A-Z])/, '_\1').downcase!
    s.slice!(0)
    s
  end
end

class Class
  def to_sym
    s = self.name.to_s.gsub!(/([A-Z])/, '_\1').downcase!
    s.slice!(0)
    s
  end
end

# module AbeCat
# end
# 
# class AbeFugl
# end
# 
# puts AbeCat.to_sym
# puts AbeFugl.to_sym
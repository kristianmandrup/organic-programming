class Filter
  def apply_on(obj)
    obj
  end
end

module FilterMapper
  def get_filter(contexts, roles)
    Filter.new
  end
end

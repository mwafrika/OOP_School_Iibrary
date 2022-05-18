class Hashit
  def initialize(hash)
    hash.each do |k, v|
      instance_variable_set("@#{k}", v)
      self.class.send(:define_method, k, proc {
                                           instance_variable_get("@#{k}")
                                         })
      self.class.send(:define_method, "#{k}=", proc { |va|
                                                 instance_variable_set("@#{k}", va)
                                               })
    end
  end
end

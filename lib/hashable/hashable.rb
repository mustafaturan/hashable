module Hashable
  # Return recursively hash representation of the object
  #
  # @return hash
  def to_deep_hash
    hash = {}
    instance_variables.each do |key|
      hash[key[1..-1].to_sym] = deeply_to_hash(instance_variable_get(key))
    end
    hash
  end
  alias_method :to_dh, :to_deep_hash

  protected
    # nodoc
    def convert_hash_values(hash)
      new_hash = {}
      hash.each do |key, val|
        new_hash[key] = deeply_to_hash(val)
      end
      new_hash
    end

    # nodoc
    def convert_array_values(array)
      new_array = []
      array.each_index do |index|
        new_array[index] = deeply_to_hash(array[index])
      end
      new_array
    end

    # nodoc
    def deeply_to_hash(val)
      if val.is_a?(Hash)
        convert_hash_values(val)
      elsif val.is_a?(Array)
        convert_array_values(val)
      elsif val.respond_to?(:to_dh)
        val.to_dh
      else
        val
      end
    end
end
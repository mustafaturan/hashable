require File.dirname(__FILE__) + '/hashable'

class Array
  include Hashable
  # Return recursively hash representation of the given array
  #
  # @return array
  def to_deep_hash  
    new_array = []
    self.each_index do |index|
      new_array[index] = deeply_to_hash(self[index])
    end
    new_array
  end
  alias_method :to_dh, :to_deep_hash
end
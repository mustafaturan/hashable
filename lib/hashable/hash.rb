require File.dirname(__FILE__) + '/hashable'

class Hash
  include Hashable

  # Return recursively hash representation of the given hash
  #
  # @return Base object instance variables in a Hash
  def to_deep_hash
    hash = {}
    self.keys.each do |key|
      hash[key] = deeply_to_hash(self[key])
    end
    hash
  end
  alias_method :to_dh, :to_deep_hash
end
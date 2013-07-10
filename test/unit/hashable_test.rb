require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper'))

class HashableTest < Test::Unit::TestCase
  def test_to_deep_hash
    hash_representation = {
      :blist => [ { :id => 1}, {'b' => { :id => 2 } } ]
    }
    assert_equal(hash_representation, A.new().to_dh)
  end
end

class A
  include Hashable
  attr_accessor :blist
  def initialize
    @blist = [ B.new(1), { 'b' => B.new(2) } ]
  end
end

class B
  include Hashable
  attr_accessor :id
  def initialize(id); @id = id; end
end
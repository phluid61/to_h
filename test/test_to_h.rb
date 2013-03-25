require 'test/unit'
require "#{File.dirname(File.dirname(__FILE__))}/lib/to_h"

class Test_Hash_to_h < Test::Unit::TestCase

  class HashSubclass < Hash; end

  def test_to_h
    h = {}
    assert_same h, h.to_h
    assert_instance_of Hash, HashSubclass.new.to_h
  end

end

class Test_Struct_to_h < Test::Unit::TestCase

  FooBar = Struct.new :foo, :bar

  def test_to_h
    assert_equal({:foo => 456, :bar => 123}, FooBar.new(456, 123).to_h)
  end

end

class Test_ENV_to_h < Test::Unit::TestCase

  def test_to_h
    assert_equal ENV.to_hash, ENV.to_h
  end

end

class Test_NilClass_to_h < Test::Unit::TestCase

  def test_to_h
    assert_equal({}, nil.to_h)
  end

end

require "#{File.dirname(File.dirname(__FILE__))}/lib/ostruct/to_h"

class Test_OpenStruct_to_h < Test::Unit::TestCase

  def test_to_h
    ost = OpenStruct.new
    ost.foo = 456
    ost.bar = 123
    assert_equal({:foo => 456, :bar => 123}, ost.to_h)
  end

end
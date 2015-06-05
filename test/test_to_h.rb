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

class Test_Enumerable_to_h < Test::Unit::TestCase

  class Enum
    include Enumerable

    def each
      yield [1, 2]
      yield [8, 9]
    end
  end

  class EnumWithArg
    include Enumerable

    def each(arg)
      yield arg
      yield [8, 9]
    end
  end

  class EnumWithArgs
    include Enumerable

    def each(*args)
      yield args
      yield [8, 9]
    end
  end

  HasToAry = Object.new
  def HasToAry.to_ary
    [1, 2]
  end

  def test_to_h
    assert_equal -1, Enumerable.instance_method(:to_h).arity

    assert_equal({1 => 2, 8 => 9}, Enum.new.to_h)
    assert_equal({1 => 2, 8 => 9}, EnumWithArg.new.to_h([1, 2]))
    assert_equal({1 => 2, 8 => 9}, EnumWithArgs.new.to_h(1, 2))
    assert_equal({1 => 2, 8 => 9}, EnumWithArg.new.to_h(HasToAry))

    assert_raise TypeError do
      EnumWithArg.new.to_h("This object does not have `.to_ary'")
    end

    assert_raise ArgumentError do
      EnumWithArgs.new.to_h.each(1, 2, 3)
    end
  end

end

class Test_Array_to_h < Test::Unit::TestCase

  HasToAry = Object.new
  def HasToAry.to_ary
    [1, 2]
  end

  def test_to_h
    assert_equal 0, Array.instance_method(:to_h).arity

    assert_equal({1 => 2, 8 => 9}, [[1, 2], [8, 9]].to_h)
    assert_equal({1 => 2, 8 => 9}, [HasToAry, [8, 9]].to_h)

    assert_raise TypeError do
      ["This object does not have `.to_ary'", [8, 9]].to_h
    end

    assert_raise ArgumentError do
      [[1, 2], [8, 9, 10]].to_h
    end
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

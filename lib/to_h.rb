# to_h - Add SomePairs#to_h for compatibility with Ruby 2.0~
# Copyright (c) 2012 Kenichi Kamiya

# @see http://d.hatena.ne.jp/nagachika/20120416/ruby_trunk_changes_35337_35352

if RUBY_VERSION < '2.0'

  class Hash

    # @return [Hash]
    def to_h
      instance_of?(Hash) ? self : Hash[self]
    end

  end

  class Struct

    # @return [Hash]
    def to_h
      Hash[each_pair.to_a]
    end

  end

  class << ENV

    # @return [Hash]
    alias_method :to_h, :to_hash

  end

  class NilClass

    # @return [Hash]
    def to_h
      {}
    end

  end

end

if RUBY_VERSION < '2.1'

  module Enumerable

    # @return [Hash]
    def to_h(*args)
      hash = {}

      each(*args) do |element|
        unless element.respond_to? :to_ary
          raise TypeError, "wrong element type #{element.class} (expected array)"
        end
        pair = element.to_ary
        unless pair.length == 2
          raise ArgumentError, "element has wrong array length (expected 2, was #{pair.length})"
        end
        hash[pair[0]] = pair[1]
      end

      hash
    end

  end

  class Array

    # Delegating to Enumerable#to_h is OK.
    # This override keeps arity and better warnings.
    # @return [Hash]
    def to_h
      hash = {}

      each_with_index do |element, index|
        unless element.respond_to? :to_ary
          raise TypeError, "wrong element type #{element.class} at #{index} (expected array)"
        end
        pair = element.to_ary
        unless pair.length == 2
          raise ArgumentError, "wrong array length at #{index} (expected 2, was #{pair.length})"
        end
        hash[pair[0]] = pair[1]
      end

      hash
    end

  end

end

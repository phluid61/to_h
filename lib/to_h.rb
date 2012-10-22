# to_h - Add SomePairs#to_h for compatbility with Ruby 2.0~
# Copyright (c) 2012 Kenichi Kamiya

# @see http://d.hatena.ne.jp/nagachika/20120416/ruby_trunk_changes_35337_35352

if RUBY_VERSION <= '2.0'

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

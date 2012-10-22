require 'ostruct'

if RUBY_VERSION <= '2.0'

  class OpenStruct

    # @return [Hash]
    def to_h
      @table.dup
    end

  end

end

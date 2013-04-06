module ActiveSupport
  module Cache
    class BitzerStore < Store
      VERSION = Gem::Version.new("0.0.1")
      PUBLIC_METHODS = %w|clanup clear read fetch delete exist? delete_matched write increment decrement|
      PROTECTED_METHODS = %w|read_entry write_entry delete_entry|

      def initialize(config)
        raise ArgumentError, "BitzerStore needs default config. Supply a hash with a :default key." unless config.has_key?(:default)

        @flocks = {}
        config.each do |name, store_option|
          @flocks[name.to_sym] = ActiveSupport::Cache.lookup_store(store_option)
        end
      end

      (PUBLIC_METHODS + PROTECTED_METHODS).each do |method_name|
        class_eval <<-EVAL,  __FILE__, __LINE__ + 1
          def #{method_name}(*args, &block)
            sheep(args.last).#{method_name}(*args, &block)
          end
        EVAL
      end

      protected *PROTECTED_METHODS

      private

      def sheep(options)
        @flocks[sheep_name(options)] || @flocks[:default]
      end

      def sheep_name(options)
        (options && options.is_a?(Hash) && options[:sheep].presence || :default).to_sym
      end
    end
  end
end

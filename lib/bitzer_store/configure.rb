require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/object/blank'

module BitzerStore
  class Configure
    def self.setting(config)
      raise ArgumentError, "block not supplied" unless block_given?
      c = Configure.new
      yield(c)
      config.cache_store = :bitzer_store, c.settings
    end

    attr_reader :settings

    def initialize
      @settings = {}
    end

    def set(name, *args)
      options = default_options.merge(args.extract_options!)
      args = args.presence || default_args
      args << options if options.present?

      @settings[name] = args
    end

    def method_missing(name, *args, &block)
      set(name, *args)
    end

    def default(*args)
      @default_options = args.extract_options!
      @default_args = args
    end

    private

    def default_args
      @default_args || []
    end

    def default_options
      @default_options || {}
    end
  end
end

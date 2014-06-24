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
      options = common_options.merge(args.extract_options!)
      args = args.presence || common_args
      args = args + [options] if options.present?

      @settings[name] = args
    end

    def method_missing(name, *args, &block)
      set(name, *args)
    end

    def common_setting(*args)
      @common_options = args.extract_options!
      @common_args = args
    end

    private

    def common_args
      @common_args || []
    end

    def common_options
      @common_options || {}
    end
  end
end

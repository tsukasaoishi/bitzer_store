require "bitzer_store/version"
require "bitzer_store/configure"

module BitzerStore
  def self.configure(rails_config, &block)
    Configure.setting(rails_config, &block)
  end
end

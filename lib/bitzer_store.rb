require "bitzer_store/version"
require "bitzer_store/configure"

module BitzerStore
  def self.configure(rails_config)
    Configure.setting(rails_config)
  end
end

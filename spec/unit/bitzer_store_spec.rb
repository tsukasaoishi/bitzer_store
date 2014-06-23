require 'spec_helper'
require 'rails'

describe BitzerStore do
  context ".configure" do
    it "set cache_store config" do
      c = Rails::Application::Configuration.new
      BitzerStore.configure(c) do |cache|
        cache.common_setting :dalli, "localhost:11211", :expires_in => 600
        cache.default :namespace => "tsuka"
      end

      expect(c.cache_store).to eq([:bitzer_store, {:default=>[:dalli, "localhost:11211", {:expires_in=>600, :namespace=>"tsuka"}]}])
    end
  end
end

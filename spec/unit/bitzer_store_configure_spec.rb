require 'spec_helper'

describe BitzerStore::Configure do
  context "#set" do
    it "add settings" do
      c = BitzerStore::Configure.new
      c.set(:cache_name, :dalli, "localhost:11211", :expires_in => 600)
      expect(c.settings.keys.first).to eq(:cache_name)
      expect(c.settings.values.first).to eq([:dalli, "localhost:11211", :expires_in => 600])
    end

    it "use method_missing" do
      c = BitzerStore::Configure.new
      c.cache_name :dalli, "localhost:11211", :expires_in => 600
      expect(c.settings.keys.first).to eq(:cache_name)
      expect(c.settings.values.first).to eq([:dalli, "localhost:11211", :expires_in => 600])
    end

    it "use default" do
      c = BitzerStore::Configure.new
      c.default :dalli, "localhost:11211", :expires_in => 600
      c.cache_name :namespace => "special"
      expect(c.settings.keys.first).to eq(:cache_name)
      expect(c.settings.values.first).to eq([:dalli, "localhost:11211", :expires_in => 600, :namespace => "special"])
    end
  end
end

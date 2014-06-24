require 'spec_helper'

describe BitzerStore::Configure do
  context "#set" do
    it "add settings" do
      c = BitzerStore::Configure.new
      c.set(:cache_name, :dalli, "localhost:11211", :expires_in => 600, :namespace => "tsu")
      c.set(:cache_name2, :dalli, "localhost:11211", :expires_in => 600, :namespace => "oishi")
      c.settings.each do |k, v|
        case k
        when :cache_name
          expect(v).to eq([:dalli, "localhost:11211", :expires_in => 600, :namespace => "tsu"])
        when :cache_name2
          expect(v).to eq([:dalli, "localhost:11211", :expires_in => 600, :namespace => "oishi"])
        end
      end
    end

    it "use method_missing" do
      c = BitzerStore::Configure.new
      c.cache_name :dalli, "localhost:11211", :expires_in => 600, :namespace => "tsu"
      c.cache_name2 :dalli, "localhost:11211", :expires_in => 600, :namespace => "oishi"
      c.settings.each do |k, v|
        case k
        when :cache_name
          expect(v).to eq([:dalli, "localhost:11211", :expires_in => 600, :namespace => "tsu"])
        when :cache_name2
          expect(v).to eq([:dalli, "localhost:11211", :expires_in => 600, :namespace => "oishi"])
        end
      end
    end

    it "use common_setting" do
      c = BitzerStore::Configure.new
      c.common_setting :dalli, "localhost:11211", :expires_in => 600, :namespace => "tsuka"
      c.cache_name :namespace => "special"
      c.cache_name2 :namespace => "oishi"
      c.settings.each do |k, v|
        case k
        when :cache_name
          expect(v).to eq([:dalli, "localhost:11211", :expires_in => 600, :namespace => "special"])
        when :cache_name2
          expect(v).to eq([:dalli, "localhost:11211", :expires_in => 600, :namespace => "oishi"])
        end
      end
    end
  end
end

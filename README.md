# BitzerStore

[![Gem Version](https://badge.fury.io/rb/bitzer_store.svg)](http://badge.fury.io/rb/bitzer_store) [![Build Status](https://travis-ci.org/tsukasaoishi/bitzer_store.svg?branch=master)](https://travis-ci.org/tsukasaoishi/bitzer_store) [![Code Climate](https://codeclimate.com/github/tsukasaoishi/bitzer_store/badges/gpa.svg)](https://codeclimate.com/github/tsukasaoishi/bitzer_store)

The cache of Rails uses the cache cluster only one.
BitzerStore can treat multiple cache clusters.

## Installation

Add this line to your application's Gemfile:

    gem 'bitzer_store'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitzer_store

## Usage

1.config
at ```config/environments/*.rb```

```ruby
MyApp::Application.configure do
  BitzerStore.configure(config) do |cache|
    cache.default :mem_cache_store, "server0"
    cache.top_page :mem_cache_store, "server1", "server2"
    cache.obj :dalli, "server3" 
    cache.footer :file_store, "/tmp"
  end
end
```

The ```xxx``` of ```cache.xxx``` is name of cache cluster.
You should supply ```cache.default``` which is used to cache cluster of default.

You can specify the setting common items. 
Setting common items will be overwritten with individual setting.

```ruby
MyApp::Application.configure do
  BitzerStore.configure(config) do |cache|
    cache.common_setting :memcache_store, "server0", :expires_in => 600
    cache.default :namespace => "tsu"
    cache.top_page :dalli, "server1"
  end
end
```

The contents of the above is the same as below.

```ruby
MyApp::Application.configure do
  BitzerStore.configure(config) do |cache|
    cache.default :memcache_store, "server0", :expires_in => 600, :namespace => "tsu"
    cache.top_page :dalli, "server1", :expires_in => 600 
  end
end
```

2.Rails.cache
When specify no name, to use default cache cluster.

```ruby
Rails.cache.read("a")
```

Supply an options with a :sheep key. It's value is cache cluster name.

```ruby
Rails.cache.read("a", :sheep => :cluster_a)
```

caches_action, fragment_cache are the same.

```ruby
<% cache "page", :sheep => :cluster_a do %>
  <%= somethong %>
<% end %>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

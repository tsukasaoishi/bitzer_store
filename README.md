# BitzerStore

BitzerStore can treat individual cache clusters in Rails.
Rails cache normally uses one cache cluster.

    config.cache_store = :mem_cache_store, "server1", "server2"

BitzerStore can use several named cache cluster.

## Installation

Add this line to your application's Gemfile:

    gem 'bitzer_store'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitzer_store

## Usage

1.config
at config/environments/*.rb

    config.cache_store = :bitzer_store, {
      :default => [:mem_cache_store, "server0"],
      :top_page => [:mem_cache_store, "server1", "server2"],
      :obj => [:dalli, "server3"],
      :footer => [:file_store, "/tmp"]
    }

Each hash key is name of cache cluster.
You should supply :default key which is used to default cache cluster.

2.Rails.cache
When specify no name, to use default cache cluster.

    Rails.cache.read("a")

Supply an options with a :sheep key. It's value is cache cluster name.

    Rails.cache.read("a", :sheep => :cluster_a)

caches_action, fragment_cache are the same.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

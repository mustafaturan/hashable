# Hashable

Makes objects to hash recursively.

## Installation

Add this line to your application's Gemfile:

    gem 'hashable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hashable

## Usage

Include 'Hashable' in your objects and then objects will have to_dh method and as an alias method to_deep_hash
  
### Sample
    require 'hashable'
    class A
      include Hashable
      attr_accessor :id, :name
    end
    
    a = A.new
    a.to_dh

or

    a.to_deep_hash
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

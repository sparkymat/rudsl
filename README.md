# Rudsl

Rudsl is a functional DSL in Ruby, for generating HTML (and eventually, CSS).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rudsl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rudsl

## Usage

### Example 1

```ruby
include Rudsl

node = div class:'list-container' do
  ul do
    %w(Hello world).each do |word|
      li word
    end
  end
end

node.to_s # will return "<div class="list-container"><ul><li>Hello</li><li>world</li></ul></div>"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rudsl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

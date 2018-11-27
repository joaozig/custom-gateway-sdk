# CustomGateway

Unofficial ruby sdk for [Custom Gateway](http://www.custom-gateway.co.uk/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'custom_gateway'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install custom_gateway

## Usage

Before use the sdk, you need to configure it with your username and password:

```ruby
CustomGateway.config do |c|
  c.username = 'your_username'
  c.password = 'your_password'
end
```
If you're using Rails, put the following code into `config/initializers/custom_gateway.rb`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joaozig/custom-gateway-sdk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

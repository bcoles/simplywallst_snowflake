# SimplyWallSt Snowflake API Client

An unofficial client for [Simply Wall St Snowflake API](https://simplywall.st/api/about).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplywallst_snowflake'
```

## Usage

Create a new `SimplywallstSnowflake::Client` object with the desired exchange and stock ticker.

```ruby
require 'simplywallst_snowflake'
client = SimplywallstSnowflake::Client.new(exchange, ticker)
```

For example:

```ruby
client = SimplywallstSnowflake::Client.new('ASX', 'TLS')
```

The following `client` properties are available:

```
  response
  url
  company_name
  unique_symbol
  primary_exchange_symbol
  primary_ticker_symbol
  snowflake_scores
  snowflake_colour
  widget_url
  snowflake_tile_url
  value
  future
  past
  health
  income
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bcoles/simplywallst_snowflake.


## Documentation

SimplyWall.St [Snowflake Widget API Documentation](https://simplywall.st/api/about)


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


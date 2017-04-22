# coding: utf-8
#
# Copyright (c) 2017 Brendan Coles <bcoles@gmail.com>
# SimplywallstSnowflake - https://github.com/bcoles/simplywallst_snowflake
# See the file 'LICENSE.txt' for copying permission
#

require 'simplywallst_snowflake/version'
require 'net/http'
require 'json'

module SimplywallstSnowflake
  class Client
    attr_reader :response
    attr_reader :url

    attr_reader :company_name
    attr_reader :unique_symbol
    attr_reader :primary_exchange_symbol
    attr_reader :primary_ticker_symbol
    attr_reader :snowflake_scores
    attr_reader :snowflake_colour
    attr_reader :widget_url
    attr_reader :snowflake_tile_url

    attr_reader :value
    attr_reader :future
    attr_reader :past
    attr_reader :health
    attr_reader :income

    def initialize(exchange, ticker)
      raise "Error - Invalid exchange: '#{exchange}'" unless exchange =~ /\A[a-zA-Z0-9]+\z/
      raise "Error - Invalid ticker: '#{ticker}'" unless ticker =~ /\A[a-zA-Z0-9]+\z/

      @url = URI("https://simplywall.st/api/snowflake/#{exchange}:#{ticker}")

      begin
        response = Net::HTTP.get(@url)
      rescue => e
        raise "Error - Could not connect to SimplyWall.St: #{e.message}"
      end

      if response.nil? || response.to_s.eql?('') || response.to_s.eql?('{}')
        raise 'Error - No response from SimplyWall.St'
      end

      @response = JSON.parse(response)

      unless @response['message'].nil?
        raise "Error - Could not retrieve snowflake: #{@response['message']}"
      end

      # Shortened company name
      @company_name            = @response['companyName']
      # Unique joined symbol for the company
      @unique_symbol           = @response['uniqueSymbol']
      # Primary exchange symbol
      @primary_exchange_symbol = @response['primaryExchangeSymbol']
      # Primary ticker symbol
      @primary_ticker_symbol   = @response['primaryTickerSymbol']
      # Array of scores for each axis of the snowflake [ Value, Future, Past, Health, Income ]
      @snowflake_scores        = @response['snowflakeScores']
      # Scaled float used in colouring the snowflake, range 0.0 (healthy) to 1.0 (bad)
      @snowflake_colour        = @response['snowflakeColour']
      # A URL to the snowflake tile as a widget to be used in an iframe
      @widget_url              = @response['widgetURL']
      # A URL to a rendered tile of the companies snowflake
      @snowflake_tile_url      = @response['snowflakeTileURL']

      # Value - value based on future cash flows and its price relative to the stock market 
      @value  = @snowflake_scores[0]
      # Future Performance - expected performance in the next 3 years
      @future = @snowflake_scores[1]
      # Past Performance - historical performance over the past 5 years
      @past   = @snowflake_scores[2]
      # Health - financial health and the level of debt
      @health = @snowflake_scores[3]
      # Income - the current dividend yield, its volatility and sustainability 
      @income = @snowflake_scores[4]
    end
  end
end

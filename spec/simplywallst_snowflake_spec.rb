#
# Copyright (c) 2017 Brendan Coles <bcoles@gmail.com>
# SimplywallstSnowflake - https://github.com/bcoles/simplywallst_snowflake
# See the file 'LICENSE.txt' for copying permission
#
require "spec_helper"

RSpec.describe SimplywallstSnowflake do
  before do
    @response = SimplywallstSnowflake::Client.new('AU', 'random')
  end

  it "has a version number" do
    expect(SimplywallstSnowflake::VERSION).not_to be nil
  end

  it "has a response" do
    expect(@response.response).not_to be nil
  end

  it "has a url" do
    expect(@response.url).not_to be nil
  end

  it "has a company name" do
    expect(@response.company_name).not_to be nil
  end

  it "has a unique symbol" do
    expect(@response.unique_symbol).not_to be nil
  end

  it "has a primary exchange symbol" do
    expect(@response.primary_exchange_symbol).not_to be nil
  end

  it "has a primary ticker symbol" do
    expect(@response.primary_ticker_symbol).not_to be nil
  end

  it "has a snowflake scores" do
    expect(@response.snowflake_scores).not_to be nil
  end

  it "has a snowflake colour" do
    expect(@response.snowflake_colour).not_to be nil
  end

  it "has a widget url" do
    expect(@response.widget_url).not_to be nil
  end

  it "has a snowflake tile url" do
    expect(@response.snowflake_tile_url).not_to be nil
  end

  it "has a value" do
    expect(@response.value).not_to be nil
  end

  it "has a future" do
    expect(@response.future).not_to be nil
  end

  it "has a past" do
    expect(@response.past).not_to be nil
  end

  it "has a health" do
    expect(@response.health).not_to be nil
  end

  it "has a income" do
    expect(@response.income).not_to be nil
  end

end

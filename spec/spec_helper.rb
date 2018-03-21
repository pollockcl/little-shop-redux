ENV["RACK_ENV"] ||= "test"

require 'simplecov'
require 'bundler'
SimpleCov.start
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

Bundler.require(:default, :test)

Capybara.app = LittleShopApp

DatabaseCleaner.strategy = :truncation


RSpec.configure do |c|
  c.include Capybara::DSL
end

RSpec.configure do |c|
  c.before(:each) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
end

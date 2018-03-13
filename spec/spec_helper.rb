
require 'bundler'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

ENV["RACK_ENV"] ||= "test"
Bundler.require(:default, :test)

DatabaseCleaner.strategy = :truncation

Capybara.app = LittleShopApp

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

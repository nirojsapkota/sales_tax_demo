# frozen_string_literal: true

# bundler to include required gems
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'csv', require: false
  gem 'rubocop', require: false

  group :test do
    gem 'rspec'
  end
end
puts 'Gems installed'

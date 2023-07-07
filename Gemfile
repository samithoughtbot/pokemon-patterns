source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false
gem "simple_form"
gem "view_component"

group :development, :test do
  gem "rspec-rails", "~> 5.1.2"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "pry", "~> 0.13.1"
  gem "standard"
end

group :test do
  gem "capybara"
  gem "shoulda-matchers", "~> 5.0"
  gem "formulaic"
  gem "rspec_junit_formatter", require: false
end

group :development do
  gem "web-console"
  gem "i18n-debug"
end

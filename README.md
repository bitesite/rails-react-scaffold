# Rails React Scaffold

This gem will allow you create scaffold for Ruby on Rails applications that use React as their front end. It basically overrides the default Views in the rails scaffold generator to generate a mount point HTML file and an associated React component for all the default Rails views (index, show, new, edit).

**Note: This gem is in its early days of development and right now only supports generating the views. Thus you have to have an existing model to use this. In the future, we will program an entire scaffold generator.**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_react_scaffold'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rails_react_scaffold

## Usage

At this point, this generator only generates VIEWS and assumes a model is in place. So at this point, use the standard model andd controller generators that come pre-built with Rails or build your own, then use this generator.

### Basic Usage

```
rails g rails_react_scaffold:views MODEL_NAME
```

### Options

|Option|Description|Default|
|------|-----------|-------|
|`--component_dir`|The directory where the generated components will be placed|app/javascript/components|


### Example Usage

```
rails g rails_react_scaffold:views Book --component_dir app/javascript/src
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_react_scaffold. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rails_react_scaffold/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsReactScaffold project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_react_scaffold/blob/main/CODE_OF_CONDUCT.md).

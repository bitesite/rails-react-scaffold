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

**At this point, this generator only generates a CONTROLLER and VIEWS and assumes a model is in place**. So at this point, use the standard model generator that comes pre-built with Rails or code your own model, then use this generator.

### Basic Usage

#### Step 1

Generate your Rails model however you want.

#### Step 2

```
rails g rails_react_scaffold:controller MODEL_NAME
```

### Options

|Option|Type|Description|Default|
|------|----|-----------|-------|
|`component_dir`|string|The directory where the generated components will be placed|`app/javascript/components`|
|`component_ext`|string|The file extension to use for generated react components. (js, jsx)|`js`|
|`ajax_engine`|string|What you want to use to make your Ajax calls (fetch, jQuery, axios) **axios coming soon**|`fetch`|
|`json_engine`|string|What to use to generate your JSON responses (jbuiler, [rabl](https://github.com/nesquena/rabl)) **jbuilder coming soon**|`jbuilder`|
|`use_cancan`|boolean|If you want to load and authorize resources through [CanCan(Can)](https://github.com/CanCanCommunity/cancancan).|`false`|
|`use_remount`|boolean|If you want to use [Remount](https://github.com/rstacruz/remount) to mount your components.|`false`|
|`use_webpacker`|boolean|If you want to use javascript_pack_tag to include your JS in your ERB files.|`false`|
|`use_webpacker_chunks`|boolean|If you want use javascript_packs_with_chunks_tag to include your JS in your ERB files.|`false`|


### Example Usage

```
rails g rails_react_scaffold:controller Book --component_dir app/javascript/src --use_cancan --ajax_engine jquery --use_webpacker_chunks
```

#### Example Use Case 1

Setup

- Rails 7 default
- ESBuild
- RABL
- Remount
- Book model already setup

```
rails g rails_react_scaffold:controller Book --json_engine rabl --component_dir app/javascript/components --component_ext jsx --use_remount
```

Then add the following to your `app/javascript/application.js`

```
import './components/books/books_edit_page';
import './components/books/books_form';
import './components/books/books_index_page';
import './components/books/books_new_page';
import './components/books/books_show_page';
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

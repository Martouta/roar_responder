# RoarRepresenter

The bare minimum to easily render roar representers as responses in Rails. It is a much simpler gem than 'roar-rails'. But it also supports MongoID.
I'm ensuring that it renders well for JSON but I have not checked it for XML.
Another limitation is that I've only made it work for class representers and not for module representers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roar_responder'
```

And then execute:

```bash
bundle install
```

TODO: require in case of usage inside an engine

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

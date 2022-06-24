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

## Dependencies

TODO

## Usage

Include the concern (module) in the controller(s) you want with this line:

```ruby
include ::RoarResponder::ControllerRespondable
```

If you want to use this gem inside a `Rails::Engine`, require the gem by adding the following line in `lib/{YOUR_ENGINE}/engine.rb`.

```ruby
require 'roar_responder'
```

## Development

TODO

```bash
docker-compose up -d
./test/dummy/bin/setup
bundle exec rake test
```

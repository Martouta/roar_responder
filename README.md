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

TODO

```bash
docker-compose up -d
./test/dummy/bin/setup
bundle exec rake test
```

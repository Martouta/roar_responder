# RoarRepresenter

The purpose of this gem is to use `roar` representers with `respond_with` in a way that you can use multiple representers for the same model and for the same controller but without being mandatory.

It contains the bare minimum to easily render roar representers as responses in Rails. It is a much simpler gem than `roar-rails`. But it also supports MongoID.
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

This gem requires to be used inside Rails alongside the gems [roar](https://github.com/trailblazer/roar) and [responders](https://github.com/heartcombo/responders).

## Usage

### Include the code in the controller(s)

Include the concern (module) in the controller(s) you want with this line:

```ruby
include ::RoarResponder::ControllerRespondable
```

If you want to use this gem inside a `Rails::Engine`, require the gem by adding the following line in `lib/{YOUR_ENGINE}/engine.rb`.

```ruby
require 'roar_responder'
```

### Respond in the controller(s)

There are 3 possible ways to render the representer. They are the following, by order of what takes first in case that multiple are defined.

1. At the controller action (instance level). Define it like `respond_with entity, representer_class: EntityRepresenter`.
2. At the controller class level. Define it like `self.represents = { entity: EntityRepresenter, collection: CollectionRepresenter }`.
3. Inferred. This means that if you do not specify a representer in any of the 2 previous ways, it uses the representer inside `app/representers` with the file name of `model_name` with `_representer.rb`. If this file does not exist, it follows the default serialization of the entity/object itself.

You can render any object that responds to `to_model` and `model_name`. This works for any entity and collection of ActiveRecord, Mongoid, and other bare ruby objects that use ActiveModel features.

## Development/Test

I usually test like this:

```bash
docker-compose up -d
./test/dummy/bin/setup
bundle exec rake test
```

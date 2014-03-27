# Resthook

## About Resthook

Resthook is a mountable implementation of the [Resthook pattern](www.resthook.org).
By adding Resthook to your rails application you can instantly provide discoverable callbacks and integrations. We've built it to integrate [Rooster](www.getrooster.com) with Zapier.

## Usage
### Installation
Add resthook to your `Gemfile`
```ruby
gem 'resthook'
```
and run `bundle install`

Next add resthook to your `config/routes` file
```ruby
mount Resthook::Engine, at: "/resthook"
```

### Configuration
Now that you have resthook installed you'll need to let it know what resources you want to provide hooks for.

Create an initializer in `config/initializers/resthook.rb`
```ruby
Resthook.configure do |config|
  hook :model_name, events: [:create, :update, :delete]
end
```





This project rocks and uses MIT-LICENSE.

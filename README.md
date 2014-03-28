# Resthook

## About Resthook

Resthook is a mountable implementation of the [Resthook pattern](www.resthook.org).
By adding Resthook to your rails application you can instantly provide discoverable callbacks and integrations. We've built it to integrate [Rooster](www.getrooster.com) with Zapier.

[![Build Status](https://travis-ci.org/yosemsweet/resthook.svg?branch=master)](https://travis-ci.org/yosemsweet/resthook)
[![Coverage Status](https://coveralls.io/repos/yosemsweet/resthook/badge.png)](https://coveralls.io/r/yosemsweet/resthook)
[![Code Climate](https://codeclimate.com/github/yosemsweet/resthook.png)](https://codeclimate.com/github/yosemsweet/resthook)
[![Inline docs](http://inch-pages.github.io/github/yosemsweet/resthook.png)](http://inch-pages.github.io/github/yosemsweet/resthook)


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

With each model you want track
```ruby
class Account < ActiveRecord::Base
	hook
end
```
if you want to only expose hooks for specific actions you can specify those as well
```ruby
class Account < ActiveRecord::Base
  hook actions: [:create, :delete]
end
```

### Authorization restrictions
In some cases you may not want to allow any old resthook consumer to subscribe to a models hooks. You can restrict the consumers by providing an authorization lambda.
```ruby
class Post < ActiveRecord::Base
  hook authorization: -> do |token, options|
    account = Account.find_by(key: token)
    authorized = false
    if(options.has_key? :post_id)
      # options includes the resource id for delete and update subscriptions
      post = Post.find(options[:post_id])
      authorized = post && post.account == account
    elsif(options.has_key? :account_id)
      # authorization for create subscriptions
      authorized = account.id == options[:account_id]
    end
    authorized
  end
end
```






This project rocks and uses MIT-LICENSE.

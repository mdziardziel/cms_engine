# CmsEngine
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cms_engine'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install cms_engine
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Hooking into app
1. Place `mount CmsEngine::Engine, at: "/cms"` in your `routes.rb`
2. Copy migrations by typing `bin/rails cms_engine:install:migrations` in console
3. Run migrations in `cms_engine` scope `bin/rails db:migrate SCOPE=cms_engine`
4. have fun!
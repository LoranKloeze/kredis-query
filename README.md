# Kredis Query 🔍🔎
A plugin for Kredis that adds querying functionality.

## Installation
Make sure you have a `gem "kredis"` entry in your Gemfile.

Now add `kredis-query` to your Gemfile:
```ruby
    gem "kredis-query"
```
Run `bundle install`.

## Usage

```ruby
# Returns the search results in batches of *approximately* 1.000 keys
Kredis.search('user_names:*') do |key_batch|
  key_batch == [ 'user_names:1', 'user_names:2', ... ]
end

# Optionally you can change the batch size hint. Since it's a hint,
# there is no guarantee the size of each batch matches the hint.
# Check https://redis.io/commands/scan/#the-count-option for more info.
#
# Returns the search results in batches of *approximately* 750 keys 
Kredis.search('user_names:*', batch_size: 750) { ... }

# Using a different than the default `shared` redis instance, relying on `config/redis/secondary.yml`:
Kredis.search('user_names:*', config: :secondary) { ... }
```

## Development
As you can see, this gem is in its very early stages. Feel free to create an issue or a PR to improve or enhance functionality! 🙂

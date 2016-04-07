# EStat

A Ruby wrapper for the e-Stat API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'e-stat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install e-stat

## Usage

```ruby
require 'e-stat'

EStat.configure do |config|
  config.app_id = 'YOUR_APP_ID'
end

EStat.stats_list(openYears: '2016', statsCode: '00200502', searchKind: '3', statsNameList: 'Y')
```


```ruby
require 'e-stat'

client = EStat::Client.new(app_id: 'YOUR_APP_ID')
list = client.stats_list(openYears: '2016', statsCode: '00200502', searchKind: '3')
stats = client.stats_data(statsDataId: list['GET_STATS_LIST']['DATALIST_INF']['TABLE_INF'][0]['@id'])
```

## Test

```
$ export APP_ID=YOUR_APP_ID
$ bundle exec rspec spec
```

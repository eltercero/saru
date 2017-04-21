# Saru (猿)

Saru (猿) is a wrapper for the Wanikani API, but it is focused on the SRS system, including a lot of searching methods not available in the API. If you're looking for a complete Wanikani API wrapper, check out [dennmart's great gem](https://github.com/dennmart/wanikani-gem).

## Installation

To get the latest stable, add this to your Gemfile:

    gem 'saru'

To get the latest code, add this:

    gem 'saru', git: https://github.com/eltercero/saru

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install saru

## Usage

### Setup

You'd need to add your API key before doing anything.

```ruby
require 'saru'

# You can also have them in your env => ENV["WANIKANI_API_KEY"]
Saru.setup do |config|
  config.api_key = 'your_api_key'
end
```

### Request items using Wanikani API

```ruby
require 'saru'

# With Saru you can replicate the API behaviour.
# For instance, let's get all Kanjis for the first level with
# the user's specific information

> kanjis_1 = Saru.kanji 1
=> #<Saru::List:0x007f871a1defb8
 @items=
  [#<Saru::Kanji:0x007f8719bc34a8
    @available_date=1472052600,
    @burned=true,
    @burned_date=1472057541,
    @character="二",
    @important_reading="onyomi"
    ...

> first_kanji = kanjis_1.items.first
=> #<Saru::Kanji:0x007fa2b5a1c430
 @available_date=1472052600,
 @burned=true,
 @burned_date=1472057541,
 @character="二",
 @important_reading="onyomi",
 @kunyomi="ふた",
 @level=1,
 @meaning="two",
 @meaning_correct=8
 ...

# You can also request more than one level. For example:
> kanjis_4_5 = Saru.kanji [4,5]
=> #<Saru::List:0x007f871a888df0
 @items=
  [#<Saru::Kanji:0x007f871a21c9f8
    @available_date=1474518600,
    @burned=true,
    @burned_date=1474523699,
    @character="花",
    @important_reading="kunyomi",
    @kunyomi="はな"
    ...
```

### Extended search

**Note:** These methods are not supported by Wanikani API queries. This means they are done _after_ the request in Wanikani.

```ruby
> Saru.vocabulary(20..25).unlocked_between(DateTime.parse('2017/01/01'), DateTime.parse('2017/02/01'))
=> #<Saru::List:0x007f8719c4e698
 @items=
  [#<Saru::Vocabulary:0x007f8719cdeb30
    @available_date=1501066800,
    @burned=false,
    @burned_date=0,
    @character="崎",
    @kana="さき",
    @level=23,
    @meaning="cape, small peninsula"
    ...

# You can chain methods too.

> Saru.kanji(1..26).srs_is_not_burned.total_incorrect_larger_than(10)
=> #<Saru::List:0x007f871a92e368
 @items=
  [#<Saru::Kanji:0x007f871a339778
    @available_date=1500118200,
    @burned=false,
    @burned_date=0,
    @character="組",
    @important_reading="onyomi",
    @kunyomi="くみ"
    ...
```

### Available search methods

#### SRS
* List#srs_numeric_larger_than(number)
* List#srs_numeric_smaller_than(number)
* List#srs_in(states)
* List#srs_is_apprentice
* List#srs_is_guru
* List#srs_is_master
* List#srs_is_enlighten
* List#srs_is_burned
* List#srs_is_not_apprentice
* List#srs_is_not_guru
* List#srs_is_not_master
* List#srs_is_not_enlighten
* List#srs_is_not_burned

#### Unlocked date
* List#unlocked_after(date)
* List#unlocked_before(date)
* List#unlocked_between(start_date, end_date)

#### Available date
* List#available_after(date)
* List#available_before(date)
* List#available_between(start_date, end_date)

#### Incorrect counters
* List#meaning_incorrect_larger_than(number)
* List#meaning_incorrect_smaller_than(number)
* List#reading_incorrect_larger_than(number)
* List#reading_incorrect_smaller_than(number)
* List#total_incorrect_larger_than(number)
* List#total_incorrect_smaller_than(number)

#### Kanji Related (only for Kanji requests)
* List#onyomi_is(reading)
* List#kunyomi_is(reading)
* List#important_reading_is(reading)

## Contributing

What? Really? So nice of you for considering, you are the best.

I could really use a hand adding more modules for Saru::List so it could be more helpful. Right now there are many radical/kanji/vocabulary attributes without a search method.

1. Fork it ( http://github.com/eltercero/saru/fork )
2. Create your feature branch (`git checkout -b missing_features`)
3. Commit your changes (`git commit -am 'いいといいですね！'`). Don't forget to add a spec!
4. Push to the branch (`git push origin missing_features`)
5. Create new Pull Request

## License

Released under the [MIT License](http://opensource.org/licenses/MIT).


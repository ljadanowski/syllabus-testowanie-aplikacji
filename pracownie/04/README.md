## 2 metody

1\. Napisać metodę, która posortuje elementy według liczby
powtórzeń, zaczynając od wartości powtarzających się najrzadziej.
Metodę nazwać `sort_by_freq` i dodać ją do modułu Enumerable:

```ruby
module Enumerable
  def sort_by_freq
    # ... dopisać brakujący kod
  end
end
puts [1,2,3,4,1,2,4,8,1,4,9,16].sort_by_freq.join(", ")
# 3, 8, 9, 16, 2, 2, 1, 1, 1, 4, 4, 4
```

Zacząć od napisania testów w pliku *spec/part1_spec.rb*.


2\. Dla dużych tablic zwierających stosunkowo niewiele różnych
obiektów wyliczyć histogram obrazujący częstotliwość
występowań danego obiektu. Metodę nazwać `to_hist`
i dodać ją do modułu Enumerable:

```ruby
module Enumerable
  def to_hist
    # ... dopisać brakujący kod
  end
end
# [1, 3, 3, 4, 4, 4].to_hist #=> {1=>1, 3=>2, 4=>3}
```

Zacząć od napisania testów w pliku *spec/part2_spec.rb*.


## Dokumentacja do RSpec

[RSpec documentation](http://rspec.info/):

* [rspec-rails](https://github.com/rspec/rspec-rails)
* [rspec-collection_matchers](https://github.com/rspec/rspec-collection_matchers)
* [rspec-expectations](https://github.com/rspec/rspec-expectations)
* [rspec-core](https://github.com/rspec/rspec-core)
* [rspec-mocks](https://github.com/rspec/rspec-mocks)

Testy uruchamiamy w następujący sposób:

```sh
rspec       # tylko kropki
rspec -cfd  # więcej szczegółów
```

## Podpinanie aplikacji do [Travisa](https://travis-ci.org/)

* [getting started](http://docs.travis-ci.com/)
* [.travis.yml](.travis.yml)
* install *travis-lint* gem
* [status images](http://docs.travis-ci.com/user/status-images/)

Jeszcze jeden przykładowy plik *.travis.yml*:

```yaml
language: ruby
rvm:
- 2.1.1
env:
- DB=postgresql
cache: bundler
before_script:
- psql -c "CREATE DATABASE dbreview_test;" -U postgres
- cp config/database.yml.travis config/database.yml
- bundle exec rake db:test:load
script:
- bundle exec rspec
```

## Użyteczne linki do klas/modułów Rubiego

* [Array](http://www.ruby-doc.org/core-2.1.1/Array.html)
* [Hash](http://www.ruby-doc.org/core-2.1.1/Hash.html)
* [Enumerable](http://www.ruby-doc.org/core-2.1.1/Enumerable.html)

To też nalezy przejrzeć:

* [String](http://www.ruby-doc.org/core-2.1.1/String.html)
* [Regexp](http://www.ruby-doc.org/core-2.1.1/Regexp.html)

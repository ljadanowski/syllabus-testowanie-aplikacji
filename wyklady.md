### Rozkład materiału przedmiotu
## Testowanie aplikacji w Ruby

* 8 wykładów = 7*2 godz. + 1 godz.

### Wykłady

1\. Wprowadzenie do języka Ruby.

2\. Podstawowe klasy i moduły.

- Przegląd metod klas *Array* i *Hash*.

3\. Ogólnie o testowaniu, dostępne narzędzia i technologie.

- Instalacja potrzebnych narzędzi:
  Ruby Version Manager (RVM), edytor (Atom/Emacs/Vim).
- Wprowadzenie do *RSpec* – korzystamy z gemów
  *Capybara* i *Factory Girl*.

4\. Testy jednostkowe, integracyjne.

- Różnice między testami.
- Znaczenie testów.
- Jak testowany jest kod klas *Array* i *Hash*?

5\. Refaktoryzacja kodu.

- Na czym polega refaktoryzacja kodu?
- Co to jest *bad smells in code* (w literaturze spotyka się też określenie *smoked code*)?
- Co to jest samotestujący się kod?
- Pokrycie kodu testami.

6\. Obiekty *doubles* (*mocks*, *stubs*).

- *Fake Objects*.
- Do czego używamy doubles?
- Główne zasady stosowania doubles.
- Problemy, nadużycia, ograniczenia.

7\. Praca z *Legacy Code*, czyli
   z już istniejącym kodem lub kodem nie pokrytym testami (Michael Feathers).

- Praca z „zastanym kodem”.
- Pokrycie testami.

8\. Refaktoryzacja Legacy Code.


----

[NSS Software Development Fundamentals - Spring 2013][1] –
tutaj jest rozpiska na zajęcia w kolejnych tygodniach zajęć.
Coś takiego trzeba będzie zrobić później. Pewnie w maju lub czerwcu.

[1]: https://github.com/elizabrock/NSS-Syllabus-Spring-2013


### Slajdy

#### Wykład 1. Wprowadzenie do języka Ruby.

1\. Skrypt *hello world*.

Bash:
```sh
export RUBYOPT=-w # turn on verbose mode
```

Skrypt *hello_world.rb*:
```ruby
#!/bin/env ruby
puts "hello world"
```

Gemy – co to jest?

Więcej informacji:
* M. Marohnić. Ruby verbose mode and how it's broken.
  http://mislav.uniqpath.com/2011/06/ruby-verbose-mode/
* Bozhidar Batsov. Ruby Style Guide: https://github.com/bbatsov/ruby-style-guide
* Integracja statycznego analizatora kodu rubocop: https://github.com/bbatsov/rubocop
  z edytorami (Atom, Emacs).

<!-- IPython + Ruby: https://github.com/minad/iruby -->

2\. Podstawowe elementy języka: instrukcje warunkowe.

- `if / elsif / else / end`, modyfikator `if`
- `unless / else / end`, modyfikator `unless`
- `case / when / else / end`

3\. Podstawowe elementy języka: pętle.

- `while / end`, modyfikator `while`
- `begin / end / while`
- `until / end`, modyfikator `until`
- `for / in / end`
- wcześniejsze kończenie pętli: `break`, `next`, `redo`

4\. Podstawowe elementy języka: metody (funkcje).

- `def / end`, domyślne wartości parametrów
- wartość (wartości) zwracane
- zmienna liczba parametrów
- `alias` i `undef`

5\. Podstawowe elementy języka: klasy.

- Obiektowość: data encapsulation, data abstraction,
  polymorphism, inheritance
- `class Indentifier / end`
- `obiekt = ClassName.new`
- zmienne lokalne, zmienne instancji, zmienne klasowe, zmienne globalne
- metody obiektu, klasy

6\. Podstawowe elementy języka: moduły.

Modułów używamy do grupowania metod, klas i stałych.

- `module Identyfikator / end`
- `require 'name'`; `include ModuleName`
- `class Identifier / include ModuleName / end`

Zalety modułów:

- dostarczają przestrzeni nazw
- moduły implementują domieszkowanie/*mixin*

7\. Korzystamy z Gemów.

- Bundler – co to jest? http://bundler.io/
- pliki *Gemfile* i *Gemfile.lock*
- Bundler i RVM

*hello_bundler.rb*
```ruby
#!/bin/env ruby
require 'bundler/setup'

require 'nokogiri'  # http://nokogiri.org/
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.google.com/search?q=rspec'))
doc.css('h3.r a').each do |link|
  puts link.content
end
```

8\. Przykładowe skrypty.

- argumenty wywołania programu
- przetwarzanie opcji: http://www.sitepoint.com/command-line-apps-optionparse/


#### Wykład 2. Podstawowe klasy.

1\. Przegląd metod klas Array i Hash.

2\. Klasy Date i Time

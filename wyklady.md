### Rozkład materiału przedmiotu
## Testowanie aplikacji w Ruby

* 8 wykładów = 7*2 godz. + 1 godz.
* Kod użyty w przykładach jest dostępny w repozytorium
  https://github.com/projekty/syllabus-testowanie-aplikacji/
  (TODO: przenieść kod do osobnego repozytorium.)

<!--

[NSS Software Development Fundamentals - Spring 2013][1] –
tutaj jest rozpiska na zajęcia w kolejnych tygodniach zajęć.
Coś takiego trzeba będzie zrobić później. Pewnie w maju lub czerwcu.

[1]: https://github.com/elizabrock/NSS-Syllabus-Spring-2013

-->

### Wykłady

1\. Wprowadzenie do języka Ruby.

2\. Podstawowe klasy i moduły.

- Przegląd metod klas *Array* i *Hash*.
- Klasy *Date*, *Time* i *DateTime*.

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


### Slajdy

#### Wykład 1. Wprowadzenie do języka Ruby

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

8\. Skrypty: zmienne `ARGV`, `ARGF`, biblioteka *optparse*

- argumenty wywołania programu: commands, options

Przykłady: wyklady/1/google.rb, wyklady/1/word_trans.rb

Bash:
```sh
./google.rb tdd
./word_trans.rb hello -u
./word_trans.rb hello -u -r
```

Więcej informacji:
- http://stackoverflow.com/questions/273262/best-practices-with-stdin-in-ruby
- http://ozmm.org/posts/argf.html


#### TODO: Wykład 2. Podstawowe klasy i moduły

1\. Klasa *Array*

Dokumentacja (Ruby Core):
- http://www.ruby-doc.org/core-2.1.2/Array.html

Składnia:

- `a = [4, 8, 2]; b = -10...0, 0..10]; c = [[1,2], [3,4]]`
- `words = %w{ala ma kota}`

Indeksowanie:

- `d = ('a'..'e').to_a`
- `d[-2,2]; d[0..2]; d[0...-1]`

2\. Klasa *Hash*

Dokumentacja (Ruby Core):
- http://www.ruby-doc.org/core-2.1.2/Hash.html

Składnia (Ruby 2.0.0+):

- `liczby = {one: 1, two: 2, three: 3}`
- `liczby[:one]`
- `liczby2 = {"one" => 1, "two" => 2, "three" => 3}`
- `liczby2["one"]`

3\. Moduł *Enumerable*

Dokumentacja (Ruby Core):
- http://www.ruby-doc.org/core-2.1.2/Enumerable.html

Pętle:

- `(2..4).each { |x| print x }`
- `(2..4).each_with_index { |x,i| print x,i }`
- `(1..10).each_slice(4) { |x| priny x }`

Sortowanie:

- `w = %w{wiśnia gruszka czereśnia}`
- `w.sort`
- `w.sort { |a,b| b<=>a }`
- `w.sort { |a,b| a.size<=>b.size }`

4\. Klasy *Date*, *Time* i *DateTime*

- Tworzenie obiektu Time.          wyklady/2/10-hello_time.rb
- Co się składa na czas?           wyklady/2/20-hello_time.rb
- Strefy czasowe.                  wyklady/2/30-hello_time.rb
- Formatowanie Time i Date.        wyklady/2/40-hello_time.rb
- Parsowanie Time i Date.          wyklady/2/50-hello_time.rb
- Arytmetyka i porównywanie Time.  wyklady/2/60-hello_time.rb

Dokumentacja (Ruby StdLib):
- http://www.ruby-doc.org/stdlib-2.1.2/libdoc/date/rdoc/Date.html
- http://www.ruby-doc.org/stdlib-2.1.2/libdoc/time/rdoc/Time.html
- http://www.ruby-doc.org/stdlib-2.1.2/libdoc/date/rdoc/DateTime.html


#### TODO: Wykład 3. Ogólnie o testowaniu, dostępne narzędzia i technologie

TODO: 4–5 slajdów.

1\. Jakaś definicja testowania.

Wymienić używane frameworki do testowania.
Dopisać mocne i słabe strony framweworków.

2\. Dlaczego korzystamy z frameworka RSpec?

- Gemfile dla RSpec

*Gemfile*:
```ruby
group :development do
  gem 'rspec'
end
```
Uruchamiamy *RSpec* w trybie development:

```sh
TODO: jak?
```

3\. Korzystamy z gemów Capybara i Factory Girl.

TODO: Gemfile, po przykładzie dla każdego z gemów.


4\. Dostępne narzędzia

- Ruby Version Manager (RVM),
- Konfiguracja edytora (Atom/Emacs) do pracy z frameworkami

– ... TODO: jeszcze coś?


5\. Technologie jakie?

- continous integration – Travis?
- ...


#### TODO: Wykład 4. Testy jednostkowe

Testy jednostkowe – co to jest?

Zautomatyzowany test pisany przez programistę
testujący pojedyńczy element systemu w izolacji.

TODO: kod – 2–3 przykłady testów, tak aby było widać izolację.

2\. Po co piszemy testy jednostkowe

* Natychmiastowy feedback.
* Wyraźna lokalizacja błędu.
* Lepszy kod – TODO: wyjaśnić w jakim sensie.

3\. Automatyzacja z pomocą RSpec, Guard

Co automatyzujemy: TODO – dopisać.

*Gemfile*:
```ruby
group :development do
  gem 'rspec'
  gem 'guard'
  gem 'guard-rspec'
end
```

Bash:
```sh
bundle install
```

4\. Testujemy: test-first czy test-last?

TODO: napisać kiedy test-first czy test-last.

Piszemy kod: top-down czy bottom-up?

Mantra Test Driven Development (TDD):

    Red -> Green -> Refactor

* Red – napisz test, który nie przechodzi
* Green – dopisz kod, tak aby test przeszedł
* Refactor – wyeliminuj nadmiarowy/zbędny kod

W trakcie pisania kodu nasze zrozumienie problemu
i co traktować jako „unit” ewoluują.

Kiedy zmieniamy kod, musimy zmienić też testy.


5\. Izolacja – TODO: jakich elementów

Jak osiągamy izolację:

* Dzielimy kod na pliki
* Korzystamy z baz danych, gemów…

TODO: Dla mnie niejasne.
Czy można to co powyżej odrobinkę uszczegółowić?


6\. Jak testowany jest kod Ruby Core i Std-lib.

Ruby Core: https://github.com/ruby/ruby/tree/trunk/test/ruby

- Array: https://github.com/ruby/ruby/blob/trunk/test/ruby/test_array.rb
- Hash: https://github.com/ruby/ruby/blob/trunk/test/ruby/test_hash.rb

Ruby Std-lib:

- Date, DateTime, Time: https://github.com/rubysl/rubysl-date/tree/2.0/spec
- StringScanner: https://github.com/rubysl/rubysl-strscan/tree/2.0/spec


#### TODO: Wykład 5. Refaktoryzacja kodu

1\. Na czym polega refaktoryzacja kodu?

    Red -> Green -> Refactor

Program wyliczający dla każdego *klienta* opłaty za *wypożyczenie* *filmu*
(przykład z książki „Refactoring. Ruby Edition”).

Klasy wyklad/5/00-wypozyczalnia.rb:

- *Movie*
- *Rental*
- *Customer*

Uwagi odnośnie kodu: „quick and dirty program”.
Słabo zaprojektowany. Mało obiektowy.

Dlaczego? Przekonamy się o tym jak zaczniemy zmieniać kod.
Na przykład, dodamy nowe `results` w HTML,
zmienią się zasady naliczania opłat (do poprawki też oba `results`),
zmienią się kategorie filmów

**Zanim zaczniemy refactoryzację kodu powinniśmy dopisać testy!**
Dlaczego? Feedback, Regression…

2\. Refaktoryzacja #1.

Dekompozycja i redystrybucja metody `statement`.
Dlaczego? za długi kod. Mniejszymi kawałkami łatwiej zarządzać.

Plik: wyklad/5/01-wypozyczalnia.rb

Bash:
```sh
diff -U 0 00-wypozyczalnia.rb 01-wypozyczalnia.rb
```
Zastosowane techniki:

- *Extract Method* do instrukcji `case`.
  Jak to zrobić w bezpieczny sposób bez wprowadzenia bugów do kodu?
  Uważnie?

3\. Instrukcję `case` zamieniamy na `this_amount = amount_for(element)`

```ruby
this_amount = 0
case element.movie.price_code
when Movie::Regular
  this_amount += 2
  this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2
when Movie::NEW_RELAESE
  this_amount += element.days_rented * 3
when Movie::CHILDRENS
  this_amount += 1.5
  this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
end
```

4\. Metoda `amount_for`

```ruby
def amount_for(rental)
  result = 0
  case rental.movie.price_code
  when Movie::REGULAR
    result += 2
    result += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
  when Movie::NEW_RELEASE
    result += rental.days_rented * 3
  when Movie::CHILDRENS
    result += 1.5
    result += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
  end
end
```

W oryginalnym kodzie zmieniamy nazwy zmiennych:
`element` -> `rental`, `this_amount` -> `result`

5\. Refaktoryzacja #2.

Przenosimy obliczenia `amount_for` do klasy Rental.
Dlaczego?
Korzysta z informacji z Rental i nie korzysta – z Customer.

Plik: wyklad/5/02-wypozyczalnia.rb

Bash:
```sh
diff -U 0 01-wypozyczalnia.rb 02-wypozyczalnia.rb
```

6\. Klasy Rental i Customer (tylko zmiany)

```ruby
class Rental
  def charge
    ...
  end
end
class Customer
  def amount_for(rental)
    rental.charge
  end
end
```

Po napisaniu metody `charge` i sprawdzeniu, że niczego
nie popsuliśmy, starą metodę `amount_for` zastępujemy nową `charge`
(`this_amount` jest zbędne).


7\. Refaktoryzacja #3.

Ekstrakcja `frequent_renter_points`:
przenosimy z klasy Customer do klasy Rental

```ruby
frequent_renter_points += 1
if element.movie.price_code = Movie::NEW_RELEASE && element.days_rented > 1
  frequent_renter_points += 1
end
```
Plik: wyklad/5/03-wypozyczalnia.rb


8\. Klasy Rental i Customer (tylko zmiany)

```ruby
class Rental
  def frequent_renter_points
    movie.price_code = (Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end
class Customer
  ...
  @rentals.each do |element|
    frequent_renter_points += element.frequent_renter_points
  ...
end
```

9\. Refaktoryzacja #4.

Niebezpieczne zmienne tymczasowe:

- użyteczne w kontekście metody, zachęcają
  do pisania długich skomplikowanych metod

Usuwamy dwie zmienne tymczasowe:

    total_amount i frequent_renter_points

10\. Zamieniamy `total_amount` metodą prywatną `total_charge`

Plik: wyklad/5/04-wypozyczalnia.rb

To nie jest prosty przypadek eliminacji zmiennej tymczasowej –
musimy wykonać jescze raz pętlę.

```ruby
def total_charge
  #  result = 0
  #  @rentals.each do |element|
  #    result += element.charge
  #  end
  #  result
  @rentals.inject(0) { |sum, rental| sum += rental.charge }
end
```

11\. Usuwamy zmienną tymczasową `frequent_renter_points`

Postępujemy tak samo jak w wypadku `total_amount` powyżej.

Plik: wyklad/5/05-wypozyczalnia.rb


12\. Bonus: Customer#html_statement

Plik: wyklad/5/06-wypozyczalnia.rb


12\. Jaki kod wymaga refaktoryzacji?

- ze zduplikowanym kodem
- metody z dużą ilością kodu
- duże klasy
- długa lista argumentów
- „shotgun surgery” – zmiana w jednym miejscu pociąga za sobą
  drobne zmiany w wielu innych miejscach
- „divergent change” – przeciwieństwo „shotgun surgery”
– „feature envy” – metoda korzystająca z wielu metod
  innej klasy
- przypadek instrukcji *case* – czasami można użyć polymorfizmu
  do wyeliminowania tej instrukcji
– „message chains” – łańcuchy wywołań
– szaleństwo metaprogramowania

Co to jest *bad smells in code* (w literaturze spotyka się też określenie *smoked code*)?

13\. Co to jest samotestujący się kod?

„Classes should contain their own tests.” – Dave Thomas (1992)

W Ruby testy piszemy w oddzielnych klasach.
Tak jest w przypadku frameworków RSpec i Test::Unit


#### TODO: Wykład 6. Obiekty *doubles*

Zwane też *mockami* lub *stubami*.

1\. Prawo Demeter –
zasada minimalnej wiedzy lub Reguła ograniczania interakcji.
(„rozmawiaj tylko z (bliskimi) przyjaciółmi”)

W pełnej formie mówi ono, iż metoda danego obiektu
może odwoływać się jedynie do metod należących do:

- metod tego samego obiektu,
- metod dowolnego parametru przekazanego do niej,
- dowolnego obiektu przez nią stworzonego,
- dowolnego składnika, klasy do której należy dana
  metoda.

2\. Kiedy kod testujący *smells*?

- Duża liczba `require`
- Duża liczba *doubles*.
- Wiele linii *setup*-u, dużo kodu w *doubles*.
- Warunki (*if/case*) w kodzie testowym
- Korzystanie z konstrukcji `send(:foobar)`

Kiedy nie piszemy testów: w trakcie nauki i poznawania
bibliotek, eksperymentowania…

3\. Do czego używamy doubles?

Doubles – co to jest? TODO: wyjaśnić

- Co to są *Fake Objects.*?
- Główne zasady stosowania doubles.
- Problemy, nadużycia, ograniczenia.

4\. Testy integracyjne

TODO: wyjaśnić

5\. Testy wydajnościowe

TODO: wyjaśnić


#### TODO: Wykład 7. Praca z *Legacy Code*

Czyli praca z już istniejącym kodem lub kodem nie pokrytym testami
(Michael Feathers).

TODO: 5-6 slajdów


#### TODO: Wykład 8. Refaktoryzacja Legacy Code

Tylko 45 min godzina. Wystarczą 3 slajdy.

### Rozkład materiału przedmiotu
## Testowanie aplikacji w Ruby

* 8 wykładów = 7*2 godz. + 1 godz.
* Kod użyty w przykładach jest dostępny w repozytorium
  https://github.com/projekty/syllabus-testowanie-aplikacji/
  (TODO: przenieść kod do osobnego repozytorium.)

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


#### Wykład 2. Podstawowe klasy i moduły

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


#### Wykład 3. Ogólnie o testowaniu, dostępne narzędzia i technologie

1\. Jakaś definicja testowania.

Testowanie to proces który ma na celu weryfikację oraz walidację
oprogramowania. Weryfikacja oprogramowania ma na celu sprawdzenie,
czy wytwarzane oprogramowanie jest zgodne ze specyfikacją. Walidacja
sprawdza, czy oprogramowanie jest zgodne z oczekiwaniami użytkownika.

W środowisku ruby napupularniejsze framweworki do testowania:

- RSpec - https://github.com/rspec
- Minitest - https://github.com/seattlerb/minitest

Minitest jest dostępny w Ruby od wersji 1.9. Dużo ,,prostszy'' niż
RSpec. Jednak zapewnia wszystkie elementy potrzebne do testowania:
unit, spec, mock, benchmark. RSpec - najpopularniejszy, kompletny
system do testowania kodu w Ruby.

Nie można wskazać lepszego czy gorszego, to bardziej kwestia składni
i narzędzi. Minitest często wykorzystywany do testowania gemów by nie
zwiększać ich zależnosci.


2\. RSpec

- Gemfile dla RSpec

*Gemfile*:
```ruby
group :development do
  gem 'rspec'
end
```
Uruchamiamy *RSpec*:

```sh
bundle exec rspec
```

3\. Korzystamy z gemów Capybara i Factory Girl.

TODO: Gemfile, po przykładzie dla każdego z gemów.

Factory girl is a fixtures replacement with a straightforward definition syntax,
support for multiple build strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects),
and support for multiple factories for the same class (user, admin_user, and so on), including factory inheritance.

*Gemfile*:
```ruby
group :development do
  gem 'rspec'
  gem 'factory_girl'
end

*spec_helper.rb*
```ruby
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
```

```ruby
# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end
end
```

Capybara helps you test web applications by simulating how a real user would interact with your app.

*Gemfile*:
```ruby
group :development do
  gem 'rspec'
  gem 'capybara'
end

require 'capybara/rspec' inside test (or spec_helper)

```ruby
describe "the signin process", :type => :feature do
  before :each do
    User.make(:email => 'user@example.com', :password => 'caplin')
  end

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_link 'Sign in'
    expect(page).to have_content 'Success'
  end
end
```

4\. Dostępne narzędzia

- Ruby Version Manager (RVM), rbenv
- Konfiguracja edytora (Atom/Emacs/Vi) do pracy z frameworkami
- guard
- simplecov
- continous integration – Travis

#### Wykład 4. Testy jednostkowe

Testy jednostkowe – co to jest?

Zautomatyzowany test pisany przez programistę
testujący pojedyńczy element systemu w izolacji.

```ruby
class Array
  def sum
    reduce(0,:+)
  end
end

describe Array do
  describe '#sum' do
    it 'returns 0 for empty array' do
      expect( [].sum ).to eq(0)
    end

    it 'returns proper sum of all elements' do
      expect( [1, 2, 3, 4, 5].sum ).to eq(15)
    end

    it 'raise error if array include non numeral values' do
      expect{
        [1, 2, 3, 4, 5].sum
      }.to raise_error
    end
  end
end
```

2\. Po co piszemy testy jednostkowe

* Natychmiastowy feedback.
* Wyraźna lokalizacja błędu.
* Lepszy kod – (mniejsze metody, zgodne z filozofia Unix. Robiące tylko jedną rzecz.
                Z wyraźnymi granicami (unikamy stanów globalnych, przekazujemy stan do metody)

3\. Automatyzacja z pomocą RSpec, Guard

Najprostsze testowanie robi każdy, nawet o tym nie wiedząc. Kiedy sprawdzamy ręcznie napisany kod, czy to w konsoli czy przegladarce.
Taka forma jest nieoptymalna (zabiera dużo czasu, oraz element ludzki (znudzeni omijamy sprawdzenie wszytskiego za każdym razem).
Automatyzacja pozwala napisać serie skryptów (testów) które manualne sprawdzanie automatyzują.

Guard pozawala zrezygnować z ostatniej manualnej czynności, czyli każdorazowego uruchamiania testów ręcznie.
Obserwuje pliki nad którymi pracujemy i automatycznie uruchamia powiązane z nimi testy.

*Gemfile*:
```ruby
group :development do
  gem 'rspec'
  gem 'guard-rspec', require: false
end
```

Bash:
```sh
bundle install
bundle exec guard init rspec
bundle exec guard
```

4\. Testujemy: test-first czy test-last?

Nie ma jednej prawdziwej odpowiedzi na pytanie czy powinno sie pierw pisać kod, czy testy.
Każde z podejść ma swoje plusy i minusy.

Test first z góry daje nam 100% pokrycie testami (Każdy kod jaki dodajemy do aplikacji poprzedzony jest napisanymi do niego testami).
Pojawia się dużo testów niskopoziomowych (unitów), stosunkowo mniej integracyjnych. Dodawane by sprawdzić połączenia między unitami.
Przeciwnicy najbardziej zwracają uwagę na to, że piszemy testy do kodu który nie dokońca rozumiemy. Zajmuje też stusunkowo więcej czasu,
ale kod otrzymany na końcu jest zazwyczaj lepszy.

Najlepszą odpowiedzią na pytanie czy test-first czy tez test-last jest zrozumienie problemu. Jeśli doskonale wiemy co nasz kod ma robić.
Rozumiemy go, to najlepiej zacząc od testów, dodajać kod później. W przeciwnym wypadku najlepiej sprawdza się drugie podejście.

Piszemy kod: top-down czy bottom-up?

Zazwyczaj to od nas nie zależy. Top-down jest spotykany zazwyczaj w dużych projektach, zespołach (korporacjach), gdzie inni ludzie projektują system,
a inni go piszą. Developer wtedy zazwyczaj dostaje do napisania konkretny kawałek systemu, który został zaprojektowany przez kogoś innego.

Bottom-up, występuje w sytuacji gdy z małych części systemu budujemy złożony produkt. Często na początku nie znając dokładnego kształtu systemu.
Z małych klocków budujemy złożone systemy

https://en.wikipedia.org/wiki/Top-down_and_bottom-up_design


Mantra Test Driven Development (TDD):

    Red -> Green -> Refactor

* Red – napisz test, który nie przechodzi
* Green – dopisz kod, tak aby test przeszedł
* Refactor – wyeliminuj nadmiarowy/zbędny kod

W trakcie pisania kodu nasze zrozumienie problemu
i co traktować jako „unit” ewoluują.

Kiedy zmieniamy kod, musimy zmienić też testy.

5\. Izolacja

Jak osiągamy izolację:

* Wyznaczamy wyraźne granice między elementami systemu
* Nie korzystamy z zewnęrzych części aplikacji czy systemu: baza danych, system plików, ...

Każda część (unit) w aplikacji powinien wykonywać jedną rzecz, powinien być oddzielony od reszty systemu wyraźną granicą.
Powinien mieć ustawiony stan na wejściu operować na nim i usawiać stan wyjściowy. Ten stan wejściowy mockujemy (sztucznie go ustawiamy),
by móc go przetestować w izolacji i we wszystkich możliwych przypadkach.

6\. Jak testowany jest kod Ruby Core i Std-lib.

Jako przykłady dobrego testowania i kodu pokazał bym proejkty zgromadzowne w tej bazie: http://microrb.com
Jest tam dużo micro projektów (małych bibliotek, otestowanych i napisanych bardzo profesjonalnie)

Ruby Core: https://github.com/ruby/ruby/tree/trunk/test/ruby

- Array: https://github.com/ruby/ruby/blob/trunk/test/ruby/test_array.rb
- Hash: https://github.com/ruby/ruby/blob/trunk/test/ruby/test_hash.rb

Ruby Std-lib:

- Date, DateTime, Time: https://github.com/rubysl/rubysl-date/tree/2.0/spec
- StringScanner: https://github.com/rubysl/rubysl-strscan/tree/2.0/spec


#### Wykład 5. Refaktoryzacja kodu

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

Dlaczego? Przekonamy się o tym jak tylko zaczniemy zmieniać kod.
Na przykład, dodamy nowe `results` w HTML,
zmienią się zasady naliczania opłat (wtedy do poprawki będą oba `results`),
zmienią się / dojdą nowe kategorie filmów.

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
musimy wykonać jeszcze raz pętlę.

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

6\. Co to jest samotestujący się kod?

„Classes should contain their own tests.” – Dave Thomas (1992)

W Ruby testy piszemy w oddzielnych klasach.
Tak jest w przypadku frameworków RSpec i Test::Unit


#### TODO: Wykład 7. Praca z *Legacy Code*

Czyli praca z już istniejącym kodem lub kodem nie pokrytym testami
(Michael Feathers).


#### Wykład 8. Refaktoryzacja Legacy Code

1\. Zaawansowane techniki refaktoryzacji kodu.

Plik: wyklady/7/06-wypozyczalnia.rb

W klasie Rental w instrukcji `case` widzimy
warunek korzystajacy z wartości **atrybutu obiektu innej klasy**.

Pachnie to problemami na odległość.


2\. Dlatego przenosimy `Rental#charge` do `Movie#charge`

```ruby
class Rental
  def charge
    movie.charge(days_rented)
  end
end
class Movie
  def charge(days_rented)
    result = 0
    ... wklejamy case bez zmian
  end
end
```

Plik: wyklady/7/07-wypozyczalnia.rb


3\. Przenosimy `Rental#frequent_renter_points` do `Movie`

```ruby
class Rental
  def frequent_renter_points
    movie.frequent_renter_points(days_rented)
  end
end
class Movie
  def frequent_renter_points(days_rented)
    (price_code == Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end
```
Plik: wyklady/7/08-wypozyczalnia.rb


4\. Wymieniamy `case` korzystając z polymorfizmu

Każdy gatunek filmu jest nieco inaczej obsługiwany
(inaczej odpowiada na tę samą *message*).

Usuniemy instrukcję `case` korzystając ze *State Pattern*
(wzorzec projektowy z książki autorów *Gang of Four*).


5\. Pierwszy krok.

```ruby
class Movie
  attr_reader :price_code

  def price_code=(value)
    @price_code = value
  end

  def initialize(title, the_price_code)
    @title, self.price_code = title, the_price_code
  end
end
```
Plik: wyklady/7/09-wypozyczalnia.rb

Po tych zmianach wszystko powinno działać.

```bash
ruby 09-wypozyczalnia.rb
```

6\. Dodajemy trzy nowe klasy

* `RegularPrice`
* `NewReleasePrice`
* `ChildrenPrice`

7\. I zmieniamy kod metody `price_code=`

```ruby
class Movie
  def price_code=(value)
    @price_code = value
    @price = case price_code
      when REGULAR then RegularPrice.new
      when NEW_RELEASE then NewReleasePrice.new
      when CHILDRENS then ChildrenPrice.new
    end
  end
end
```

8\. Wybieramy metodę, która ma być polymorficzna

Wybieramy: `Movie#charge`.

```ruby
class RegularPrice
  def charge(days_rented)
    result += 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end
class Movie
  ...
  def charge(days_rented)
    result = 0
    case price_code
    when Movie::REGULAR
      @price.charge(days_rented)
```

9\. W podobny sposób upraszczamy `case`
dla `Movie::NEW_RELEASE` oraz `Movie::CHILDRENS`

```ruby
def charge(days_rented)
  result = 0
  case price_code
  when Movie::REGULAR
    return @price.charge(days_rented)
  when Movie::NEW_RELEASE
    return @price.charge(days_rented)
  when Movie::CHILDRENS
    return @price.charge(days_rented)
  end
end
```

Co można uprościć do:

```ruby
def charge(days_rented)
  @price.charge(days_rented)
end
```

Plik: wyklady/7/10-wypozyczalnia.rb


10\. Polymorficzne `Movie#frequent_renter_points`

Metoda `frequent_renter_points` jest taka sama
dla ChildrenPrice i RegularPrice, a inna dla NewReleasePrice.

Plik: wyklady/7/11-wypozyczalnia.rb

Użyjemy Modułów i domieszkowania.


11\. Moduły i domieszkowanie kodu modułów w klasach

```ruby
module DefaultPrice
  def frequent_renter_points(days_rented)
    1
  end
end
class RegularPrice
  include DefaultPrice
...
class ChildrenPrice
  include DefaultPrice
...
class NewReleasePrice
  def frequent_renter_points(days_rented)
    days_rented > 1 ? 2 : 1
  end
...
class Movie
  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
...
```

12\. Ostatni krok…

Usuwamy `case` z `price_code=`.

Jak?
Plik: wyklady/7/12-wypozyczalnia.rb

Podmieniamy przykład użycia:

```ruby
movie1 = Movie.new("Milion sposobów, jak zginąć na Zachodzie", NewReleasePrice.new)
movie2 = Movie.new("Uśpieni", ChildrenPrice.new)
```

Teraz można też zmienic kategorię filmu:

```ruby
movie2.price = RegularPrice.new
```

Poprzednio nie było to możliwe!

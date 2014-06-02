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

1. Skrypt *hello world*.

Bash:
```sh
export RUBYOPT=-w # turn on verbose mode
```

Skrypt *hello_world.rb*:
```ruby
#!/bin/env ruby
puts "hello world"
```
Więcej informacji:
* M. Marohnić. Ruby verbose mode and how it's broken.
  http://mislav.uniqpath.com/2011/06/ruby-verbose-mode/

2. Podstawowe elementy języka: pętle

3. Podstawowe elementy języka: funkcje

4. Podstawowe elementy języka: klasy

5. Podstawowe elementy języka: moduły.

6. Korzystamy z Gemów.

7. Przykładowe skrypty.



#### Wykład 2. Podstawowe klasy.

1\. Przegląd metod klas *Array* i *Hash*.

2\. Przykładowe skrypty.

## Rozkład materiału: Ruby – testowanie aplikacji

* wykłady – 5*3 godz.
* laboratoria – 15*3h.

### Wykłady

1. Powtórka z języka Ruby.
   - Wprowadzenie.
   - Piszemy proste skrypty.
   - Przegląd metod klas *Array* i *Hash*.
2. Ogólnie o testowaniu, dostępne narzędzia i technologie.
   - Instalacja potrzebnych narzędzi:
     Ruby Version Manager (RVM), edytor (Atom/Emacs/Vim).
   - Wprowadzenie do *RSpec* – korzystamy z gemów
     *Capybara* i *Factory Girl*.
3. Testy jednostkowe, integracyjne.
   - Różnice między testami.
   - Znaczenie testów.
   - Refaktoryzacja kodu.
     - Na czym polega refaktoryzacja kodu?
     - Co to jest *bad smells in code* (w literaturze spotyka się też określenie *smoked code*)?
     - Co to jest samotestujący się kod?
   - Pokrycie kodu testami.
4. Obiekty *mock* i *stub*.
   - *Fake Objects*.
   - *Doubles* (stub, mocks).
   - Do czego używamy doubles?
   - Główne zasady stosowania doubles (granice)
   - Problemy, nadużycia, ograniczenia.
5. Praca z *Legacy Code*, czyli
   z już istniejącym kodem lub kodem nie pokrytym testami (Michael Feathers).
   - Praca z „zastanym kodem”.
   - Pokrycie testami.
   - Refaktoryzacja Legacy Code.


### Laboratoria

1\. (3 godz.)
  Przygotowanie środowiska do pracy z językiem Ruby.

  - Instalacja Git, RVM.
  - Integracja z usługami na GitHub – Travis, Code Climate, Coveralls.

1\. (6 godz.)
  Tworzenie prostych skryptów w języku Ruby.

1\. (6 godz.)
  Dopisywanie brakującego kodu do nieprzechodzących testów.

1\. (6 godz.)
  Dopisywanie testów do niepokrytego nimi kodu.

1\. (9 godz.)
  *Agile Programming*.

  - Test first / Test Last
  - Zalety i wady.
  - TDD (*Test Driven Development*) w przykładach.

1\. (12 godz.)
  Własny projekt do napisania z wykorzystaniem TDD lub dowolny
  projekt z GitHub do którego dopisano testy (i kod) zaakceptowane przez
  właściela projektu.

1\. (3 godz.)
  Prezentacje najlepszych projektów.

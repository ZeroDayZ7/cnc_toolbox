Aby stworzyć aplikację **CNC Tool Pro**, która faktycznie wyróżni się na tle darmowych kalkulatorów, musisz podejść do tematu systemowo. Poniżej przedstawiam listę modułów, obliczeń i tabel, które powinny znaleźć się w profesjonalnym narzędziu dla technologów i operatorów CNC.

### 1. Rozbudowany Kalkulator Parametrów (Core)

To nie tylko $Vc$ i $Fz$, ale wzajemne powiązania:

* **Obroty ($n$) i Posuw ($Vf$):** Powiązane ze średnicą narzędzia i liczbą ostrzy.
* **Siły skrawania i Moc:** Obliczanie zapotrzebowania na moc wrzeciona ($Pc$) w oparciu o materiał (współczynnik $kc$) i objętość usuwanych wiórów ($Q$).
* **Grubość wióra ($hex$):** Kluczowe przy frezowaniu z dużymi posuwami (HFM) lub przy małych szerokościach frezowania ($ae$), gdzie występuje pocienienie wióra.
* **Chropowatość powierzchni ($Ra/Rz$):** Wyliczanie teoretycznej chropowatości na podstawie promienia płytki ($Re$) i posuwu.
* **Kompensacja promienia przy frezowaniu konturów:** Obliczanie rzeczywistego posuwu na krawędzi zewnętrznej i wewnętrznej (różnica w drodze środka narzędzia).

### 2. Tabele i Bazy Danych (Standardy PRO)

Zamiast wpisywać wszystko z ręki, użytkownik wybiera z norm:

* **Tabela Tolerancji i Pasowań (ISO 286):** Wybierasz np. `Ø40 h7` i aplikacja od razu pokazuje odchyłki (+0 / -0.025 mm).
* **Tabela Gwintów:** Pełna baza (Metryczne, drobnozwojne, UNC, UNF, G, NPT) – wymiary wierteł pod gwint, średnice podtoczeń i głębokości.
* **Katalog Materiałowy (P, M, K, N, S, H):** Baza twardości (HB/HRC) z przypisanymi średnimi prędkościami $Vc$ dla różnych typów narzędzi (VHM, Składane).

### 3. Geometria i Ustawianie Maszyny (Visual Pro)

Wizualne moduły ułatwiające pracę przy maszynie:

* **Kalkulator Trójkąta (Trygonometria):** Rozwiązywanie boków i kątów – niezbędne przy programowaniu manualnym faz i skosów.
* **Wizualizacja Bicia (Run-out):** Wpływ bicia narzędzia na jego żywotność i dokładność wymiarową.
* **Prostopadłość i Geometria (Tramming):** Kalkulator ustawiania głowicy/wrzeciona – wpisujesz odczyt z czujnika zegarowego na danej średnicy, a aplikacja mówi, jaką podkładkę dać pod kolumnę lub o ile skorygować śruby.
* **Rozstaw otworów (PCD):** Wyliczanie współrzędnych X/Y dla otworów na okręgu (pod flansze).

### 4. Moduły Specjalistyczne

* **Kalkulator Toczenia:** Czas maszynowy, zmiana średnicy a stała prędkość skrawania ($G96$ vs $G97$).
* **Kalkulator Wierteł:** Wyliczanie długości wierzchołka wiertła (kąt 118° lub 140°) – ważne przy wierceniu otworów nieprzelotowych na konkretną głębokość pełnej średnicy.
* **Analiza Ekonomiczna:** Porównanie dwóch narzędzi – koszt jednej krawędzi tnącej vs czas obróbki (czy droższe narzędzie szybciej na siebie zarobi).

### 5. Funkcje "Smart" dla Wersji Pro

* **Konwerter Jednostek:** Nie tylko mm/inch, ale też twardości (Rockwell/Brinell/Vickers) oraz momentu obrotowego.
* **Logbook Narzędziowy:** Możliwość zapisywania "ulubionych" ustawień dla konkretnych maszyn lub projektów (baza Drift, o której wspominaliśmy).
* **Kody G / Kody M:** Interaktywna lista najpopularniejszych kodów (Fanuc, Heidenhain, Siemens) z opisem i przykładem składni.
* **Diagnostyka problemów:** Drzewko decyzyjne: "Wiór się lepi" -> "Zwiększ Vc", "Zastosuj chłodzenie wewnętrzne", "Zmień powłokę".

### Przykład połączenia danych w Twoim kodzie:

Jeśli wybierzesz w UI **Materiał: Stal 42CrMo4**, aplikacja powinna:

1. Pobrać z bazy twardość (~300 HB).
2. Zaproponować $Vc$ dla freza VHM (np. 140 m/min).
3. Po wpisaniu średnicy $D=10$ automatycznie wyliczyć $n=4456$.
4. Wyświetlić ostrzeżenie, jeśli Twoje wrzeciono (zdefiniowane w profilu maszyny) ma max 4000 obr/min.

**Podsumowując:** Wersja PRO to nie tylko "wynik", to **kontekst**. Narzędzie musi wiedzieć, że parametry zależą od sztywności układu, rodzaju chłodzenia i limitów maszyny.
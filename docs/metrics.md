# Metryki DORA

Cztery kluczowe metryki wydajności zespołów DevOps.
Dwie pierwsze mierzą szybkość, dwie ostatnie – stabilność.

## 1. Deployment Frequency
**Co mierzy:** Jak często zmiany są wdrażane na produkcję.
**Cel:** Kilka razy dziennie.
**Dlaczego jest ważna:** Czeste wdrozenia oznaczaja mniejsze porcje zmian, a wiec mniejsze ryzyko i latwiejsze znalezienie przyczyny ewentualnego bledu. Klienci szybciej dostaja nowe funkcje i poprawki.

## 2. Lead Time for Changes
**Co mierzy:** Czas od commita do wdrożenia na produkcję.
**Cel:** Mniej niż 1 godzina.
**Dlaczego jest ważna:** Krotki czas od commita do produkcji pokazuje, ze proces jest sprawny i zautomatyzowany. Dlugi czas wskazuje waskie gardla, takie jak reczne testy czy dlugie zatwierdzenia.

## 3. MTTR (Mean Time To Recovery)
**Co mierzy:** Średni czas przywrócenia działania po awarii.
**Cel:** Mniej niż 1 godzina.
**Dlaczego jest ważna:** Awarii nie da sie calkowicie uniknac, dlatego kluczowe jest, jak szybko zespol potrafi je wykryc i naprawic. Krotki MTTR oznacza mniejsze straty dla firmy i mniejsza uciazliwosc dla uzytkownikow.

## 4. Change Failure Rate
**Co mierzy:** Procent wdrożeń powodujących problemy na produkcji.
**Cel:** Mniej niż 5%.
**Dlaczego jest ważna:** Pokazuje jakosc wdrazanych zmian i skutecznosc testow automatycznych. Niski wskaznik oznacza, ze szybkie tempo wdrozen nie odbywa sie kosztem stabilnosci.


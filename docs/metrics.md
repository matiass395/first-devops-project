# Metryki DORA

Cztery kluczowe metryki wydajności zespołów DevOps.
Dwie pierwsze mierzą szybkość, dwie ostatnie – stabilność.

## 1. Deployment Frequency
**Co mierzy:** 
Jak często zmiany są wdrażane na produkcję.
**Cel:** 
Kilka razy dziennie.

**Dlaczego jest ważna:** 
Częste wdrożenia oznaczają mniejsze porcje zmian, a więc mniejsze ryzyko i łatwiejsze znalezienie przyczyny ewentualnego błędu. Klienci szybciej dostają nowe funkcje i poprawki.

## 2. Lead Time for Changes
**Co mierzy:** Czas od commita do wdrożenia na produkcję.
**Cel:**
Mniej niż 1 godzina.
**Dlaczego jest ważna:** 
Krótki czas od commita do produkcji pokazuje, ze proces jest sprawny i zautomatyzowany. Długi czas wskazuje wąskie gardła, takie jak ręczne testy czy długie zatwierdzenia.

## 3. MTTR (Mean Time To Recovery)
**Co mierzy:** 
Średni czas przywrócenia działania po awarii.
**Cel:** 
Mniej niż 1 godzina.
**Dlaczego jest ważna:** 
Awarii nie da się całkowicie uniknąć, dlatego kluczowe jest, jak szybko zespół potrafi je wykryć i naprawić. Krotki MTTR to mniejsze straty dla firmy i mniejsza uciążliwość dla użytkowników.

## 4. Change Failure Rate
**Co mierzy:** 
Procent wdrożeń powodujących problemy na produkcji.
**Cel:** 
Mniej niż 5%.
**Dlaczego jest ważna:** 
Pokazuje jakość wdrażanych zmian i skuteczność testów automatycznych. Niski wskaźnik oznacza, ze szybkie tempo wdrożeń nie odbywa się kosztem stabilności.


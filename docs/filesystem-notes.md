# Notatki: system plików Linux (Debian 13 w VirtualBox)

System: Debian 13 Trixie (64-bit), jądro Linux 6.12 (`cat /proc/version` → `6.12.111+deb13-amd64`).

## /etc – konfiguracja systemu
- Zawiera pliki konfiguracyjne systemu i usług – u mnie 213 wpisów (`ls /etc | wc -l`).
- `/etc/passwd` – lista użytkowników, 7 pól oddzielonych `:` (login, x, UID, GID, opis, katalog domowy, powłoka).
  Przykład: `testuser:x:1001:1001::/home/testuser:/bin/bash`
- `/etc/passwd` ma uprawnienia `644` (czytelny dla wszystkich – programy zamieniają UID na nazwy),
  a `/etc/shadow` `640` z grupą `shadow` – hashe haseł czyta tylko root i grupa shadow.

## /var/log – logi
- Zawartość m.in.: `apt/` i `dpkg.log` (historia instalacji pakietów), `journal/` (logi journald),
  `installer/` (logi instalacji Debiana), `gdm3/` (ekran logowania), `cups/` (drukowanie),
  `vboxpostinstall.log` (instalacja VirtualBox Guest Additions).
- `wtmp`, `btmp`, `lastlog` – rejestry logowań (udanych i nieudanych); to pliki binarne,
  czyta się je poleceniami `last`, `sudo lastb`, `lastlog`.
- Brak pliku `syslog` – na Debianie 13 logi systemowe zbiera journald, odczyt: `journalctl -n 20`.

## /proc – wirtualny system plików
- Nie istnieje na dysku – jądro generuje go w locie (zasada „wszystko jest plikiem”).
- Katalogi o nazwach liczbowych to PID-y działających procesów; `/proc/$$` to moja bieżąca powłoka.
- `/proc/cpuinfo` – informacje o procesorze, `/proc/meminfo` – źródło danych dla `free -h`,
  `/proc/version` – wersja jądra.

## Plik gitconfig
- Moja konfiguracja Gita (imię, e-mail, aliasy `s` i `lg`) jest w `~/.gitconfig` – ukryty plik w katalogu domowym.
- Ogólnosystemowy `/etc/gitconfig` nie istnieje – ustawienia globalne dla wszystkich użytkowników nie są skonfigurowane.
- `git config --list --show-origin` pokazuje, z którego pliku pochodzi każde ustawienie.

## Rozmiar katalogów w /var
Wynik `sudo du -sh /var/* | sort -h`:
```
0       /var/lock
0       /var/run
4,0K    /var/local
4,0K    /var/mail
4,0K    /var/opt
52K     /var/spool
76K     /var/tmp
2,1M    /var/backups
57M     /var/log
273M    /var/lib
378M    /var/cache
```
Wnioski:
- Najwięcej zajmuje `/var/cache` (378 MB) – głównie pobrane paczki apt; można je wyczyścić przez `sudo apt clean`.
- `/var/lib` (273 MB) – bazy danych pakietów i stan usług; po instalacji Dockera urośnie (obrazy w `/var/lib/docker`).
- `/var/lock` i `/var/run` mają 0 – to dowiązania do `/run`, który jest w RAM (tmpfs).
- `sudo` jest potrzebne – bez niego `du` zgłasza „Brak dostępu” do części katalogów.

## Inne obserwacje 

### /bin to dowiązanie do /usr/bin
`ls -ld /bin` → `/bin -> usr/bin`. Na współczesnym Debianie katalogi binarne połączono w `/usr` (usrmerge),
a stare ścieżki zostały jako linki dla kompatybilności.

### Pamięć (free -h)
- RAM: 7,8 GiB, użyte 2,2 GiB, dostępne 5,5 GiB; swap 1,1 GiB, nieużywany.
- Ważniejsza jest kolumna *dostępne* niż *wolne* – Linux używa wolnej pamięci na cache plików
  i oddaje ją programom, gdy jest potrzebna.

### Dyski (df -h)
- Partycja systemowa `/dev/sda1` (19 GB) zamontowana jako `/`, zajęte 35%.
- Wpisy `tmpfs` (`/run`, `/tmp`, `/dev/shm`) to systemy plików w RAM – znikają po restarcie.
- System nie używa LVM (brak urządzeń `/dev/mapper/...`).

### Katalogi domowe
Nowo utworzony `/home/testuser` ma uprawnienia `700` (`drwx------`) – Debian domyślnie chroni prywatność
użytkowników (ustawienie `HOME_MODE` w `/etc/login.defs`), w odróżnieniu od starszego standardu 755.

### Wspólny katalog /home/project (zadanie 2)
- Klasyczne uprawnienia `770 root:developers` nie spełniają wymagania „testers tylko czytają” –
  testerzy wpadają do kategorii „inni” i nie mają dostępu.
- Rozwiązanie: ACL – `setfacl -m g:testers:rx` oraz domyślna ACL (`-d`) dla nowych plików.
  W `ls -ld` widać to jako `+` na końcu uprawnień.
- Dodatkowo bit setgid (`chmod g+s`) – nowe pliki dziedziczą grupę `developers`, dzięki czemu
  developerzy mogą edytować swoje pliki nawzajem. Bez niego developer2 nie mógł edytować pliku developer1.
- Wynik końcowy: `drwxrws---+ root developers /home/project`.


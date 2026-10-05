#!/usr/bin/env bash
# setup.sh – instaluje podstawowe narzędzia DevOps z lekcji 1

set -euo pipefail

PACKAGES=(git curl wget unzip htop tree jq)

# 1. Sprawdzenie uprawnień
if [ "$EUID" -ne 0 ]; then
    echo "BŁĄD: uruchom skrypt z sudo: sudo ./setup.sh"
    exit 1
fi

# 2. Aktualizacja listy pakietów
echo "==> Aktualizuję listę pakietów..."
apt-get update -qq

# 3. Instalacja narzędzi
for pkg in "${PACKAGES[@]}"; do
    if dpkg -s "$pkg" &>/dev/null; then
        echo "==> $pkg: już zainstalowany, pomijam"
    else
        echo "==> $pkg: instaluję..."
        apt-get install -y -qq "$pkg"
        echo "==> $pkg: zainstalowany"
    fi
done

# 4. Podsumowanie
echo ""
echo "==> Gotowe! Zainstalowane wersje:"
dpkg-query -W -f='    ${Package} ${Version}\n' "${PACKAGES[@]}"

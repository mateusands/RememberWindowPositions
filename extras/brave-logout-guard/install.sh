#!/usr/bin/env bash
# Instala o brave-logout-guard como serviço systemd de usuário.
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"

install -Dm755 "$DIR/brave-logout-guard" "$HOME/.local/bin/brave-logout-guard"
install -Dm644 "$DIR/brave-logout-guard.service" "$HOME/.config/systemd/user/brave-logout-guard.service"

systemctl --user daemon-reload
systemctl --user enable --now brave-logout-guard.service

echo "brave-logout-guard instalado e ativo."
echo "Log: ${XDG_STATE_HOME:-$HOME/.local/state}/brave-logout-guard.log"

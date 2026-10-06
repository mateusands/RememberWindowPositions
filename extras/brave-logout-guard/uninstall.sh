#!/usr/bin/env bash
# Remove o brave-logout-guard.
set -euo pipefail

systemctl --user disable --now brave-logout-guard.service 2>/dev/null || true
rm -f "$HOME/.local/bin/brave-logout-guard" \
      "$HOME/.config/systemd/user/brave-logout-guard.service" \
      "${XDG_STATE_HOME:-$HOME/.local/state}/brave-logout-guard.reopen"
systemctl --user daemon-reload

echo "brave-logout-guard removido."

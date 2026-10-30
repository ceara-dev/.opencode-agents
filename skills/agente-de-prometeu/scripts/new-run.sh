#!/usr/bin/env bash
set -euo pipefail

slug="${1:-exploratorio}"
slug="$(printf '%s' "$slug" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9._-]/-/g' | sed 's/-\+/-/g' | sed 's/^-//;s/-$//')"
if [ -z "$slug" ]; then
  slug="run"
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root="$(cd "$script_dir/../../../.." && pwd)"
stamp="$(date +%Y%m%d-%H%M%S)"
run_dir="$root/Next/qa/prometeu/runs/${stamp}-${slug}"

mkdir -p "$run_dir/screens" "$run_dir/ui" "$run_dir/logs" "$run_dir/video"

cat > "$run_dir/run.md" <<EOF
# Run ${stamp} — ${slug}

## Plano

- Missão:
- Dispositivo:
- Build/pacote:
- Riscos cobertos:
- Fora de escopo:

## Estado inicial

- App:
- Sessão:
- Conexão:

## Linha do tempo

- ${stamp} início
EOF

printf '%s\n' "$run_dir"

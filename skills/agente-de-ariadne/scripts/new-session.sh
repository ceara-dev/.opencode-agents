#!/usr/bin/env bash
set -euo pipefail

charter="${1:-exploratorio}"
charter="$(printf '%s' "$charter" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9._-]/-/g' | sed 's/-\+/-/g' | sed 's/^-//;s/-$//')"
if [ -z "$charter" ]; then
  charter="exploratorio"
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root="$(cd "$script_dir/../../../.." && pwd)"
stamp="$(date +%Y%m%d-%H%M%S)"
run_dir="$root/Next/qa/ariadne/runs/${stamp}-${charter}"

mkdir -p "$run_dir/screens" "$run_dir/ui" "$run_dir/logs" "$run_dir/video"

cat > "$run_dir/session.md" <<EOF
# Sessão ${stamp} — ${charter}

## Charter

- Missão:
- Área:
- Timebox:
- Início/fim:
- Fora de escopo:
- Riscos que quero atacar:

## Ambiente

- Dispositivo:
- Plataforma/versão:
- Build/pacote:
- API:
- Sessão/conta:

## Estado inicial

- Tela:
- Ano letivo:
- Conexão:
- Observações:

## Mapa do labirinto

- Telas:
- Transições:
- Áreas já cobertas pela suíte:
- Áreas novas:

## Heurísticas usadas

- SFDPOT:
- FEW HICCUPPS:
- RCRCRC:
- Outras:

## Linha do tempo

- ${stamp} início

## Threads

## Observações rápidas

## Debrief

- Cobertura:
- Bugs:
- Riscos:
- Perguntas abertas:
- Próximos charters:
- Estado final:
EOF

cat > "$run_dir/report.md" <<EOF
# Relatório de sessão exploratória — ${charter}

## Resultado

## Charter e timebox

- Missão:
- Área:
- Timebox:
- Executado em:

## Ambiente

- Dispositivo:
- Build/pacote:
- API:

## Cobertura

| Área | Transições | Heurísticas | Observação |
| --- | --- | --- | --- |
|  |  |  |  |

## Bugs

## Riscos e perguntas abertas

## Próximos charters

## Estado final

- Tela:
- Sessão:
- Conexão:
- Gravações/proxy:
EOF

printf '%s\n' "$run_dir"

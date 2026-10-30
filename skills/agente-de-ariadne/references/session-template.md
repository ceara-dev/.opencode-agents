# Templates da sessão exploratória

## session.md

```markdown
# Sessão <timestamp> — <charter>

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
- Sessão/conta: <sem credenciais>

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

- HH:MM — início
- HH:MM — <ação/observação>
- HH:MM — fim

## Threads

### T1 — <título>
- Gatilho:
- Observado:
- Suspeita:
- Evidência:
- Status:
- Próximo passo:

## Observações rápidas

- ...

## Debrief

- Cobertura:
- Bugs:
- Riscos:
- Perguntas abertas:
- Próximos charters:
- Estado final:
```

## report.md

```markdown
# Relatório de sessão exploratória — <charter>

## Resultado

<passou | achados | bloqueado> — <resumo em 2 linhas>

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
| ... | ... | ... | ... |

## Bugs

### B1 — <título>

- Severidade: 🔴 alta / 🟠 média / 🟡 baixa
- Reprodução: sempre / intermitente
- Pré-condições:
- Passos:
  1. ...
- Esperado:
- Obtido:
- Evidência:
- Suspeita:

## Riscos e perguntas abertas

- ...

## Próximos charters

- ...

## Estado final

- Tela:
- Sessão:
- Conexão:
- Gravações/proxy:
```

## Exemplo de charter

```markdown
## Charter
- Missão: descobrir como o app se comporta quando a rede cai durante o download do ano letivo.
- Área: login → diálogo de ano → download → Início/Escolas.
- Timebox: 30 min.
- Fora de escopo: criar aulas, enviar frequência, alterar dados no servidor.
- Riscos: estado inconsistente entre ano selecionado e dados exibidos; mensagem enganosa de sucesso; perda de cache.
```

## Regras de debrief

- Liste o que foi coberto e o que não foi.
- Separe fato de hipótese.
- Para cada bug, aponte a evidência.
- Termine com 1–3 próximos charters concretos.
- Registre o estado final do aparelho.

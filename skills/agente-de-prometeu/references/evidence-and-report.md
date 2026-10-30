# Evidências e relatório

## Estrutura da execução

```
Next/qa/prometeu/runs/<YYYYMMDD-HHMMSS>-<slug>/
├── run.md
├── report.md
├── bugs.json
├── screens/
├── ui/
├── logs/
└── video/
```

- `run.md`: plano curto, horário, dispositivo, build, pacote e decisões.
- `report.md`: relatório final.
- `bugs.json`: opcional, lista estruturada para automação.
- Arquivos: `<ordem>_<slug>.png`, `<ordem>_<slug>.json`, `<ordem>_<slug>.log`.

## Quando capturar

- Antes de um fluxo destrutivo ou irreversível.
- Em cada checkpoint de validação.
- Imediatamente após uma falha, antes de qualquer retry.
- No estado final, para provar a limpeza.

## Template de relatório

```markdown
# Run <timestamp> — <missão>

## Ambiente

- Dispositivo: <nome> (<id>), <plataforma> <versão>
- Build do app: <versão/build se conhecida>
- Pacote: br.com.servidorcaju.veramendesapp
- API: <url>
- Execução: <data/hora>

## Resultado

<passou | falhou | bloqueado> — <resumo em 2 linhas>

## Cenários executados

| ID | Cenário | Status | Observação |
| --- | --- | --- | --- |
| CT-... | ... | passou/falhou/não executado | ... |

## Bugs

### B1 — <título>

- Severidade: 🔴 alta / 🟠 média / 🟡 baixa
- Reprodução: sempre / intermitente / uma vez
- Pré-condições: ...
- Passos:
  1. ...
  2. ...
- Esperado: ...
- Obtido: ...
- Evidência: `screens/...`, `logs/...`
- Suspeita: ...

## Cobertura não executada

- <item> — motivo.

## Estado final

- App: <tela/sessão>
- Aparelho: <orientação, conexão>
- Proxy: <limpo/não usado>
```

## Rubrica de severidade

| Nível | Critério |
| --- | --- |
| 🔴 Alta | crash, perda de dados, bloqueio de fluxo principal, falha de segurança |
| 🟠 Média | erro visível, fluxo trava mas contorna, inconsistência de estado |
| 🟡 Baixa | cosmético, texto, alinhamento, usabilidade menor |

## Regras de qualidade

- Um bug por seção, com passos numerados e verificáveis.
- Não misture observação, hipótese e fato.
- Se não reproduziu, escreva "não reproduzido" e anexe a tentativa.
- Não inclua credenciais, tokens ou dados pessoais.
- Aponte arquivos de código só quando houver evidência; use `arquivo:linha`.
- Se a falha depender da API, informe o proxy e o `fault.json` usado.

---
name: agente-de-ariadne
description: "Protocolo do Agente de Ariadne para teste exploratório mobile no app e-PUBLIC Vera Mendes usando mobile-mcp. Use para sessões com charter, heurísticas, mapa de cobertura, caça a bugs sem roteiro e debrief em Android/iOS real. Triggers: teste exploratório, exploratory testing, sessão exploratória, charter, heurísticas, caça a bugs, mapear app, Agente de Ariadne, QA mobile."
---

# Agente de Ariadne

Exploradora de QA mobile. Entra no labirinto do app com um fio: charter, timebox, heurísticas e evidências. Procura riscos desconhecidos que a suíte roteirizada não cobre.

**Diferença do Agente de Prometeu:** Prometeu valida cenários conhecidos e regressões; Ariadne explora o desconhecido, mapeia o app e segue anomalias.

## Quando usar

- O usuário pede teste exploratório, caça a bugs ou sessão sem roteiro.
- O usuário quer mapear telas, estados e transições.
- O usuário quer descobrir riscos antes de uma release.
- O usuário quer complementar a suíte automatizada com descoberta.

## Pré-voo

1. Liste dispositivos:

```
mobile_list_available_devices
```

2. Escolha o dispositivo e use o mesmo `device` em todas as chamadas.
3. Confirme o app:

```
mobile_list_apps { device }
mobile_get_foreground_app { device }
```

4. Confirme o pacote `br.com.servidorcaju.veramendesapp`.
5. Verifique a API local se o charter envolver rede:

```bash
curl -s -o /dev/null -w '%{http_code}' http://192.168.0.135:8000
```

6. Crie a sessão:

```bash
.opencode/skills/agente-de-ariadne/scripts/new-session.sh <charter-slug>
```

O script cria `Next/qa/ariadne/runs/<timestamp>-<slug>/` com `screens/`, `ui/`, `logs/`, `video/`, `session.md` e `report.md`.

## Charter

Toda sessão começa com um charter curto:

```markdown
## Charter
- Missão: <uma frase sobre o que explorar>
- Área: <telas/fluxos>
- Timebox: <30 min padrão>
- Início/fim: <HH:MM>
- Fora de escopo: <o que não tocar>
- Riscos que quero atacar: <lista>
```

Se o usuário não der charter, proponha 2–3 e escolha o de maior risco. Exemplos para este app:

- Explorar login, sessão, logout e reabertura do app, incluindo erros de rede e credenciais inválidas.
- Explorar navegação, abas, menu lateral, botão voltar e deep links.
- Explorar download e troca de ano letivo, incluindo interrupção e offline.
- Explorar busca de escolas, filtros e estados vazios.
- Explorar diários, aulas, frequência, justificativas e autorizações.
- Explorar sincronização, erros 401/5xx, timeout e duplicidade.
- Explorar acessibilidade, fonte do sistema, contraste e alvos de toque.
- Explorar interrupções: ligação, notificação, background, rotação e teclado.

## Fluxo da sessão

1. **Reconhecimento (5 min)**: abra o app, registre tela inicial, sessão, ano letivo e dados visíveis. Anote o estado no `session.md`.
2. **Mapa (5 min)**: desenhe em texto as telas e transições conhecidas. Marque áreas cobertas pela suíte existente.
3. **Exploração (15 min)**: use as heurísticas. Alterne entre amplidão (varrer áreas) e profundidade (seguir uma thread).
4. **Threads (5 min)**: para cada anomalia, anote: gatilho, estado, reprodução, suspeita e onde parou.
5. **Debrief (5 min)**: consolide cobertura, bugs, riscos, perguntas abertas e próximos charters.

Não estenda o timebox sem registrar a decisão. Se o tempo acabar no meio de uma thread, anote o ponto de retomada.

## Heurísticas

Consulte `references/exploratory-heuristics.md` para o catálogo completo. Resumo:

- **SFDPOT**: Structure, Function, Data, Platform, Operations, Time.
- **FEW HICCUPPS**: Familiarity, Explainability, World, History, Image, Comparable, Claims, User expectations, Product, Purpose, Standards.
- **RCRCRC**: Recent, Core, Risk, Configuration, Repaired, Chronic.
- **Fronteiras**: vazio, um, muitos, zero, máximo, negativo, texto longo, emoji, acentos, especiais.
- **Interrupções**: ligação, notificação, background, rotação, teclado, rede, bateria.
- **Estados**: loading, vazio, erro, sucesso, parcial, offline, sessão expirada.
- **Acessibilidade**: rótulos, foco, contraste, alvos de toque, fonte do sistema, leitor de tela.

## Ferramentas

Use as ferramentas `mobile_*` do MCP. O detalhamento está em `.opencode/skills/agente-de-prometeu/references/tool-playbook.md`. Essenciais:

| Objetivo | Ferramenta |
| --- | --- |
| Listar aparelhos | `mobile_list_available_devices` |
| Abrir/fechar app | `mobile_launch_app` / `mobile_terminate_app` |
| Ler tela | `mobile_list_elements_on_screen` com `format: "json"` |
| Tocar | `mobile_click_on_screen_at_coordinates` com `ref` |
| Digitar | `mobile_type_keys` |
| Botão físico | `mobile_press_button` |
| Swipe | `mobile_swipe_on_screen` |
| Screenshot | `mobile_save_screenshot` |
| Logs | `mobile_get_device_logs` |
| Crashes | `mobile_list_crashes` / `mobile_get_crash` |
| Sequência | `mobile_batch_commands` |
| Gravar tela | `mobile_start_screen_recording` / `mobile_stop_screen_recording` |

Regras:

- Prefira `ref` a coordenadas.
- Leia a tela antes de tocar; se o elemento não estiver na árvore, use screenshot.
- Use `mobile_batch_commands` para sequências conhecidas; não para decisões.
- Evite leituras repetidas: cada leitura da árvore Flutter em debug leva 15–22 s.
- Não instale, desinstale ou limpe dados sem autorização.

## Evidência

Estrutura da sessão:

```
Next/qa/ariadne/runs/<timestamp>-<charter>/
├── session.md
├── report.md
├── screens/
├── ui/
├── logs/
└── video/
```

Em cada achado ou checkpoint:

1. `mobile_save_screenshot { device, saveTo: "<run>/screens/<nn>_<slug>.png" }`
2. `mobile_list_elements_on_screen { device, format: "json" }` e salve em `<run>/ui/<nn>_<slug>.json`.
3. `mobile_get_device_logs { device, saveTo: "<run>/logs/<nn>_<slug>.log", filter: ["level=Error"] }`
4. `mobile_list_crashes { device }`; se houver crash, `mobile_get_crash`.
5. Para intermitentes, grave a tela antes de reproduzir.

Nunca anexe credenciais, tokens ou dados pessoais. Se um screenshot tiver dados sensíveis, recorte ou descreva.

## Relatório

Use o template de `references/session-template.md` e a rubrica de severidade de `.opencode/skills/agente-de-prometeu/references/evidence-and-report.md`.

Resumo do `report.md`:

- Charter e timebox.
- Ambiente: dispositivo, build, pacote, API.
- Cobertura: áreas, transições e heurísticas usadas.
- Bugs: `# | Sev | Título | Passos | Esperado | Obtido | Evidência | Reprodução`.
- Riscos e perguntas abertas.
- Próximos charters.
- Estado final do aparelho.

## Segurança

- Não altere código do app. Só escreva em `Next/qa/ariadne/runs/`.
- Não faça escrita no servidor sem autorização.
- Não limpe dados, não desinstale, não troque o ano letivo sem autorização.
- Não use a mesma conta em dois aparelhos ao mesmo tempo.
- Não faça pagamentos ou alterações de conta.
- Em risco alto, pare e peça autorização.
- Restaure conexão, orientação, sessão e gravações ao final.

## Definição de pronto

- [ ] Charter e timebox definidos.
- [ ] Dispositivo e pacote confirmados.
- [ ] Mapa de cobertura registrado.
- [ ] Cada bug tem evidência e passos reproduzíveis.
- [ ] Nenhuma credencial exposta.
- [ ] `report.md` e `session.md` escritos.
- [ ] Aparelho e ambiente restaurados.

## Referências

- `references/exploratory-heuristics.md`: catálogo de heurísticas e ideias de teste.
- `references/session-template.md`: templates de charter, sessão e debrief.
- `scripts/new-session.sh`: cria a pasta padronizada da sessão.
- `.opencode/skills/agente-de-prometeu/references/tool-playbook.md`: detalhes das ferramentas mobile-mcp.

---
name: agente-de-prometeu
description: "Protocolo do Agente de Prometeu para QA mobile autônomo no app e-PUBLIC Vera Mendes usando mobile-mcp. Use quando a missão for explorar o app, executar cenários Gherkin, reproduzir bugs, coletar evidências em Android/iOS real ou gerar relatório de QA. Triggers: Agente de Prometeu, QA mobile, teste exploratório, executar cenário, reproduzir bug, evidências, mobile-mcp, Android, iOS."
---

# Agente de Prometeu

Agente de QA mobile autônomo. Opera um dispositivo real via `mobile-mcp`, executa cenários, investiga falhas e entrega um relatório com evidências. O objetivo é encontrar problemas reais com passos reproduzíveis, não validar suposições.

## Pré-voo

1. Liste os dispositivos:

```
mobile_list_available_devices
```

2. Escolha o dispositivo e use o mesmo `device` em todas as chamadas. Não existe dispositivo implícito.
3. Confirme que o app está instalado:

```
mobile_list_apps { device }
```

4. Confirme o pacote esperado: `br.com.servidorcaju.veramendesapp`.
5. Verifique se a API local está no ar (quando o cenário exigir):

```bash
curl -s -o /dev/null -w '%{http_code}' http://192.168.0.135:8000
```

6. Crie a pasta da execução:

```bash
.opencode/skills/agente-de-prometeu/scripts/new-run.sh <slug>
```

O script imprime o caminho de `Next/qa/prometeu/runs/<timestamp>-<slug>/`.

## Dois modos de operação

### Cenário Gherkin

Quando a missão citar um ID (`CT-LOG-...`, `CT-ANO-...`, etc.):

1. Localize o arquivo em `Next/qa/cenarios/*.feature` com `grep`.
2. Leia o cenário inteiro, incluindo `Contexto` e `Exemplos`.
3. Verifique as tags:
   - `@manual`: executar somente se o usuário autorizou.
   - `@risco-alto` ou `@destrutivo-local` ou `@escrita-servidor`: pedir autorização antes.
   - `@offline`: preparar a perda de conexão e restaurar depois.
4. Mapeie cada passo para uma ação de UI. Se um passo não for observável na árvore, use screenshot e registre a limitação.
5. Execute e colete evidência nos checkpoints.

### Exploração livre

Quando a missão for ampla ("explore o app", "procure bugs"):

1. Priorize o mapa de risco da seção "Prioridades".
2. Faça um passe read-only primeiro: login, navegação, estados vazios, erros visíveis.
3. Só avance para fluxos de escrita com autorização explícita.
4. Ao encontrar anomalia, pare, colete evidência e tente reproduzir uma vez.

## Mapa de risco

| Prioridade | Área | O que validar |
| --- | --- | --- |
| 1 | Login e sessão | campos vazios, CPF inválido, senha inválida, erro de servidor, sessão mantida, logout |
| 2 | Navegação | abas, voltar, deep links, diálogos, menu lateral |
| 3 | Ano letivo | download, troca, interrupção, offline, dados antigos |
| 4 | Escolas | busca, filtro, estado vazio, troca de aba |
| 5 | Diários e aulas | abrir, criar, editar, frequência, justificativa, autorização |
| 6 | Sincronização | offline, 401, 5xx, timeout, duplicidade, perda de dados |
| 7 | Acessibilidade | rótulos, foco, contraste, alvos de toque, fonte do sistema |
| 8 | Estabilidade | crash, ANR, background, rotação, logcat |

## Ferramentas

Use as ferramentas `mobile_*` do MCP. As principais:

| Objetivo | Ferramenta | Argumentos essenciais |
| --- | --- | --- |
| Listar aparelhos | `mobile_list_available_devices` | — |
| Abrir app | `mobile_launch_app` | `device`, `packageName` |
| Fechar app | `mobile_terminate_app` | `device`, `packageName` |
| App em foco | `mobile_get_foreground_app` | `device` |
| Listar elementos | `mobile_list_elements_on_screen` | `device`, `format: "json"` |
| Tocar | `mobile_click_on_screen_at_coordinates` | `device`, `ref` (preferir) ou `x`,`y` |
| Digitar | `mobile_type_keys` | `device`, `text`, `submit` |
| Botão físico | `mobile_press_button` | `device`, `button` (`BACK`, `HOME`, `ENTER`, `BACKSPACE`) |
| Swipe | `mobile_swipe_on_screen` | `device`, `direction`, opcional `x`,`y`,`distance` |
| Salvar screenshot | `mobile_save_screenshot` | `device`, `saveTo` terminando em `.png` |
| Salvar logs | `mobile_get_device_logs` | `device`, `saveTo` terminando em `.log`/`.txt`/`.jsonl`, `filter`, `limit` |
| Crashes | `mobile_list_crashes` / `mobile_get_crash` | `device`, `id` |
| Sequência | `mobile_batch_commands` | `device`, `steps: [{name, arguments}]` |
| Gravar tela | `mobile_start_screen_recording` / `mobile_stop_screen_recording` | `device`, `output`, `timeLimit` |
| Instalar | `mobile_install_app` | `device`, `path` (`.apk`/`.ipa`/`.app`/`.zip`) |

Regras:

- Prefira `ref` (`@e5`) a coordenadas; o ref sobrevive a diferenças de layout.
- Use `mobile_batch_commands` para sequências conhecidas (tap, type, tap), com `listElementsAtEnd: true` quando precisar conferir o resultado.
- Leia a tela antes de tocar. Se o elemento não estiver na árvore, use screenshot.
- Cada chamada é uma ida ao aparelho; evite leituras repetidas desnecessárias.
- Não use `mobile_install_app` nem `mobile_uninstall_app` sem autorização.

## Limitações conhecidas (Android/Flutter)

- Build debug/profile aberta pelo mobile-mcp expõe a árvore de semântica do Flutter. Build release cai no `uiautomator`.
- Uma leitura da árvore Flutter leva 15–22 s em debug; `uiautomator` leva ~1,5 s.
- Textos longos podem vir cortados em ~130 caracteres.
- Itens de lista sem semântica (cartões de escola/diário) não aparecem; toque abaixo de uma âncora estável.
- Tooltips (sino, sincronizar, "X") podem não ser lidos; localize pela posição.
- Com diálogo aberto, elementos atrás recebem o rótulo "Dispensar".
- Com menu lateral aberto, abas continuam na árvore; feche o menu antes de tocar.
- Se a árvore vier incompleta, aguarde e leia de novo antes de concluir que o elemento não existe.

## Evidência

Salve tudo dentro da pasta do run:

```
screens/   screenshots .png
ui/        dumps .json ou .txt
logs/      logcat .txt
video/     gravações .mp4
report.md  relatório final
bugs.json  opcional, lista estruturada
```

Em cada checkpoint ou falha:

1. `mobile_save_screenshot { device, saveTo: "<run>/screens/<nn>_<slug>.png" }`
2. `mobile_list_elements_on_screen { device, format: "json" }` e salve o texto em `<run>/ui/<nn>_<slug>.json`.
3. `mobile_get_device_logs { device, saveTo: "<run>/logs/<nn>_<slug>.log", filter: ["level=Error"] }`
4. `mobile_list_crashes { device }` e, se houver crash, `mobile_get_crash`.
5. Em falha intermitente, grave a tela com `mobile_start_screen_recording` antes de reproduzir.

Nunca anexe credenciais, tokens ou dados pessoais nas evidências. Se um screenshot contiver dados sensíveis, descreva e guarde apenas o recorte necessário.

## Relatório

Use `references/evidence-and-report.md` para o template e a rubrica de severidade. Resumo:

- Cabeçalho: data, dispositivo, build, pacote, API, missão.
- Resultado: passou / falhou / bloqueado.
- Tabela de cenários executados.
- Bugs: `# | Sev | Título | Passos | Esperado | Obtido | Evidência | Reprodução`.
- Cobertura não executada e motivo.
- Estado final do aparelho.

## Segurança

- Não modifique o código do app. Só escreva em `Next/qa/prometeu/runs/`.
- Não faça escrita no servidor (aulas, frequências, autorizações, usuários) sem autorização.
- Não limpe dados do app, não desinstale, não troque o ano letivo sem autorização.
- Não use a mesma conta em dois aparelhos ao mesmo tempo.
- Não faça pagamentos ou alterações de conta.
- Em caso de risco, pare e peça autorização.
- Restaure conexão, proxy, orientação e gravações ao final.

## Definição de pronto

- [ ] Dispositivo e pacote confirmados.
- [ ] Missão executada ou bloqueio documentado.
- [ ] Cada bug tem evidência e passos reproduzíveis.
- [ ] Nenhuma credencial exposta.
- [ ] `report.md` escrito na pasta do run.
- [ ] Aparelho e ambiente restaurados.

## Referências

- `references/tool-playbook.md`: detalhes das ferramentas e solução de problemas.
- `references/evidence-and-report.md`: estrutura de evidências, template e severidade.
- `scripts/new-run.sh`: cria a pasta padronizada de execução.

# Playbook de ferramentas — mobile-mcp

## Dispositivo

```
mobile_list_available_devices
```

Resposta inclui `id`, `name`, `platform`, `type`, `version`, `state`. Use sempre o `id` em todas as chamadas. Se houver mais de um online e a missão não indicar qual, pergunte ou escolha o Android de teste e declare a escolha.

Confirme o app:

```
mobile_list_apps { device }
mobile_get_foreground_app { device }
```

Pacote Android do app: `br.com.servidorcaju.veramendesapp`.

## Abrir e fechar

```
mobile_launch_app { device, packageName }
mobile_terminate_app { device, packageName }
```

Prefira abrir o app pela ferramenta em vez de navegar pela UI. Para builds debug/profile, abrir pelo mobile-mcp permite que ele encontre o Dart VM Service e leia a árvore de semântica do Flutter.

## Ler a tela

```
mobile_list_elements_on_screen { device, format: "json" }
```

Cada elemento tem `ref`, `type`, `text`, `label`, `value`, `identifier`, `coordinates` e estados. Use `ref` para tocar. Se a árvore vier vazia ou incompleta:

1. Aguarde 1–2 s e leia de novo.
2. Verifique se há diálogo ou teclado cobrindo a tela.
3. Use `mobile_save_screenshot` para inspecionar visualmente.
4. Em release, os tipos vêm como `android.widget.*`; em debug/profile, como widgets Flutter (`TextField`, `Button`, `Text`).

## Tocar, digitar e navegar

```
mobile_click_on_screen_at_coordinates { device, ref: "@e5" }
mobile_click_on_screen_at_coordinates { device, x, y }
mobile_type_keys { device, text, submit }
mobile_press_button { device, button }
mobile_swipe_on_screen { device, direction, x, y, distance }
```

- Prefira `ref`. Use coordenadas só quando o elemento não estiver na árvore.
- `mobile_type_keys` digita no campo focado. Toque no campo antes.
- `submit: true` equivale a Enter.
- Botões aceitos: `BACK`, `HOME`, `ENTER`, `BACKSPACE`.
- Para fechar teclado, use `BACK` uma vez e confira a tela.

## Sequências

```
mobile_batch_commands {
  device,
  steps: [
    { name: "mobile_click_on_screen_at_coordinates", arguments: { ref: "@e3" } },
    { name: "mobile_type_keys", arguments: { text: "12345678909" } },
    { name: "mobile_click_on_screen_at_coordinates", arguments: { ref: "@e7" } }
  ],
  stopOnError: true,
  listElementsAtEnd: true
}
```

Use para fluxos conhecidos. Não use para fluxos que exigem decisão entre passos.

## Evidências

```
mobile_save_screenshot { device, saveTo: "caminho/arquivo.png", maxSize: 1080 }
mobile_get_device_logs { device, saveTo: "caminho/arquivo.log", filter: ["level=Error"], limit: 500 }
mobile_list_crashes { device }
mobile_get_crash { device, id }
mobile_start_screen_recording { device, output: "caminho/video.mp4", timeLimit: 300 }
mobile_stop_screen_recording { device }
```

- `saveTo` deve terminar em `.png`, `.jpg` ou `.jpeg` para screenshot.
- Logs devem terminar em `.log`, `.txt` ou `.jsonl`.
- Filtros de log: `pid=`, `process=`, `tag=`, `level=`, `subsystem=`, `category=`, `message=`, com `!=` para excluir.
- Para Android, também é válido usar `adb -s <id> logcat -c` antes e `adb -s <id> logcat -d -v time` depois.
- Pare a gravação antes de encerrar o run.

## Instalação

```
mobile_install_app { device, path }
```

Aceita `.apk`, `.ipa`, `.app`, `.zip`. Só use com autorização e caminho fornecido. No Linux, um `.ipa` precisa estar assinado e o dispositivo pareado/confiável; App Store IPA não instala direto.

## Problemas comuns

| Sintoma | Causa provável | Ação |
| --- | --- | --- |
| Elemento não aparece | item sem semântica, texto cortado, árvore incompleta | reler, usar screenshot, tocar por âncora |
| Toque não responde | elemento coberto por diálogo/teclado | fechar diálogo/teclado, reler |
| Tela travada | app em background, ANR, diálogo do sistema | `mobile_get_foreground_app`, screenshot, logs |
| Leitura muito lenta | build debug Flutter | usar batch, evitar leituras repetidas, considerar profile |
| App não abre | pacote errado ou app não instalado | `mobile_list_apps`, confirmar pacote |
| `device` inválido | id não repassado | listar dispositivos e usar o id exato |

## Limpeza

- Fechar diálogos e teclado.
- Voltar ao estado inicial (aba, ano, sessão).
- Fazer logout se o run logou.
- Parar gravação e restaurar orientação/conexão.
- Se usou o proxy de falhas, limpar `proxy/fault.json` e restaurar a API na porta 8000.

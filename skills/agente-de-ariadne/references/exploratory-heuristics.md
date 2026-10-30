# Heurísticas de teste exploratório

## SFDPOT

| Letra | Foco | Perguntas |
| --- | --- | --- |
| S — Structure | Estrutura | O que compõe o app? Telas, abas, rotas, menus, diálogos, estados. O que está escondido ou condicional? |
| F — Function | Função | O que cada tela faz? Quais ações existem? O que acontece se repetir, cancelar ou voltar? |
| D — Data | Dados | Que dados entram e saem? Vazio, um, muitos, máximo, mínimo, inválido, duplicado, antigo, offline. |
| P — Platform | Plataforma | Android/iOS, versão, tela, teclado, permissões, fonte do sistema, orientação, rede. |
| O — Operations | Operações | Instalar, abrir, fechar, atualizar, background, matar, limpar cache, trocar usuário. |
| T — Time | Tempo | Timeout, lentidão, expiração de sessão, mudança de dia/ano, fuso, concorrência. |

## FEW HICCUPPS

- **Familiarity**: o app se comporta como produtos semelhantes?
- **Explainability**: a interface explica o que aconteceu?
- **World**: respeita fatos do mundo real (datas, calendário, nomes)?
- **History**: mantém histórico e consistência com o passado?
- **Image**: a imagem do produto é coerente?
- **Comparable**: é comparável a versões ou concorrentes?
- **Claims**: cumpre o que promete em textos, botões e mensagens?
- **User expectations**: faz o que o usuário espera?
- **Product**: atende ao propósito do produto?
- **Purpose**: cada elemento tem propósito?
- **Standards**: segue padrões, normas e acessibilidade?

## RCRCRC

- **Recent**: o que mudou recentemente?
- **Core**: quais são os fluxos centrais?
- **Risk**: onde o risco é maior?
- **Configuration**: quais configurações e ambientes variam?
- **Repaired**: o que foi corrigido e pode regredir?
- **Chronic**: o que costuma quebrar sempre?

## Fronteiras e dados

- Vazio, zero, um, dois, muitos.
- Mínimo, máximo, acima do máximo.
- Negativo, decimal, muito grande.
- Texto longo, curto, só espaços.
- Acentos, emoji, caracteres especiais, aspas, `<script>`.
- CPF com máscara, sem máscara, inválido, repetido.
- Datas: passado, futuro, hoje, virada de ano, ano bissexto.
- Nomes duplicados, nomes muito longos.
- Dados offline, antigos, parciais, corrompidos.

## Estados

- Loading inicial, loading parcial, refresh.
- Vazio real, vazio por erro, vazio por filtro.
- Erro de rede, erro de servidor, erro de validação.
- Sucesso, sucesso parcial, sucesso duplicado.
- Offline, reconexão, fila de sincronização.
- Sessão expirada, logout remoto, troca de conta.

## Interrupções

- Ligação, notificação, alarme.
- Background e retorno.
- Rotação de tela.
- Teclado aberto/fechado.
- Perda e retorno de Wi-Fi/dados.
- Bateria fraca, modo economia.
- Bloqueio/desbloqueio do aparelho.
- Matar o app e reabrir.

## Navegação

- Botão voltar do sistema em cada tela.
- Voltar depois de diálogo, bottom sheet e teclado.
- Abas: trocar, voltar, manter estado.
- Menu lateral: abrir, fechar, tocar atrás.
- Deep links: rota válida, inválida, sem `extra`, com tipo errado.
- Duplo toque rápido em ações.
- Toque repetido durante loading.

## Sincronização

- Offline antes, durante e depois.
- 401, 403, 404, 422, 500.
- Timeout e retry.
- Requisição duplicada.
- Resposta parcial.
- Ordem de sincronização (aula antes de frequência).
- Dados locais versus remotos.
- Mensagens de erro e recuperação.

## Acessibilidade

- Rótulos de campos e botões.
- Ordem de foco e navegação por teclado.
- Contraste de texto e ícones.
- Alvos de toque menores que 44×44 px.
- Fonte do sistema maior.
- Leitor de tela (TalkBack/VoiceOver).
- Texto que depende só de cor.
- Animações e `prefers-reduced-motion` (quando aplicável).

## Performance e estabilidade

- Lentidão percebida em listas grandes.
- Uso de memória ao trocar de tela repetidamente.
- Crash em rotação, background ou deep link.
- ANR em operação longa.
- Logcat com stack traces e exceções silenciosas.

## Privacidade e segurança

- Dados sensíveis visíveis em screenshots ou logs.
- Sessão persistida após logout.
- Token em texto claro.
- Acesso a telas sem autenticação.
- Permissões negadas e "não perguntar novamente".
- Deep link que expõe tela interna.

## Como registrar uma thread

```markdown
### Thread T3 — busca de escolas some após troca de aba
- Gatilho: aba Escolas → buscar "zzz" → aba Início → voltar
- Observado: campo vazio, lista vazia, escola do professor some
- Suspeita: `_searchQuery` persiste no provider
- Evidência: screens/t3_01.png, logs/t3_02.log
- Status: reproduzido 2/2
- Próximo passo: testar após logout/login
```

## Taxonomia de bugs

- Crash / ANR.
- Perda ou corrupção de dados.
- Inconsistência de estado entre telas.
- Fluxo bloqueado sem saída.
- Erro silencioso (ação falha sem feedback).
- Validação incorreta.
- Problema de sincronização.
- Problema de acessibilidade.
- Problema visual/layout.
- Problema de performance.
- Exposição de dados/segurança.

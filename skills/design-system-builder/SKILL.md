---
name: design-system-builder
description: "Extrai sistemas de design a partir de screenshots, mockups ou imagens de UI de referência e gera tokens, especificações de componentes e prompts de implementação prontos para uso. Use quando o usuário fornecer capturas de tela/maquetes de UI e quiser criar um design system, manter consistência visual ou construir UIs de MVP que correspondam à estética de referência. Triggers: design system, design tokens, style guide, DESIGN.md, screenshot, mockup, UI de referência, extrair cores, tipografia, componentes."
---

# Design System Builder

Transforma referências visuais (screenshots, mockups, imagens de UI) em um sistema de design executável: tokens, contratos de componentes, regras de layout e prompts de implementação que permitem reproduzir a estética de referência com consistência.

## Quando usar

- O usuário envia uma ou mais imagens de UI e quer um design system, style guide ou DESIGN.md.
- O usuário quer construir uma tela, MVP ou app que "pareça com" a referência.
- O usuário precisa de tokens (cores, tipografia, espaçamento) e specs de componentes para implementação.
- O usuário quer padronizar telas existentes com base em uma referência visual.

Não use para: revisão de usabilidade sem referência visual, auditoria de acessibilidade isolada, ou geração de landing page (use `landing-page-scaffold`).

## Fluxo de trabalho

### 1. Coletar contexto

Antes de analisar, confirme (ou assuma e declare):

- Imagens de referência disponíveis e o que cada uma mostra (tela, componente, estado).
- Produto, público e objetivo da interface.
- Stack de implementação (React/Tailwind, Flutter, HTML/CSS, etc.).
- Restrições: marca existente, acessibilidade, dark mode, responsividade.

Se faltar informação, assuma valores plausíveis, marque como `[assumido]` no documento e siga. Não bloqueie a entrega por detalhes menores.

### 2. Auditar a referência visual

Analise cada imagem e registre evidências antes de propor tokens:

- **Cores**: fundos, superfícies, texto, bordas, acentos, estados (hover, focus, disabled, erro, sucesso). Estime hex por amostragem visual e agrupe em primitivas + papéis semânticos.
- **Tipografia**: famílias prováveis, fallback stack, escala (display, h1–h4, body, small, caption), pesos, line-height, letter-spacing, uso de caixa alta.
- **Espaçamento e layout**: unidade-base, escala, paddings, gaps, largura de container, grid, breakpoints percebidos.
- **Formas**: raios de borda, espessuras de borda, sombras, elevação, opacidade.
- **Componentes**: botões, inputs, cards, navegação, badges, tabelas, modais, avatares, ícones.
- **Imagens e ilustrações**: estilo, proporção, tratamento (duotone, glass, grain, gradiente).
- **Movimento**: transições perceptíveis, duração, easing, microinterações.
- **Tom visual**: 3–5 adjetivos (ex.: "editorial, sóbrio, denso, preciso") e nível de densidade.

Quando a imagem não permitir precisão (cor comprimida, blur, baixa resolução), registre a incerteza e ofereça uma aproximação justificável.

### 3. Normalizar em tokens

Produza três camadas:

1. **Primitivas**: valores brutos (`color.blue.600`, `space.4`, `radius.md`).
2. **Semânticas**: intenção (`color.bg.canvas`, `color.text.muted`, `color.action.primary`, `color.feedback.danger`).
3. **Componentes**: decisões locais (`button.primary.bg`, `card.border`, `input.focus.ring`).

Regras:

- Use uma escala de espaçamento consistente (base 4 ou 8).
- Use uma escala tipográfica com no máximo 7–8 tamanhos.
- Garanta contraste mínimo WCAG AA: 4.5:1 para texto normal, 3:1 para texto grande e elementos de UI.
- Defina estados para todo elemento interativo: default, hover, active, focus-visible, disabled, loading, error.
- Prefira nomes por papel, não por aparência (`text.muted`, não `gray-500-text`).

### 4. Especificar componentes

Para cada componente relevante, documente:

- Anatomia e variantes.
- Tamanhos e espaçamentos internos.
- Estados e transições.
- Comportamento responsivo.
- Regras de conteúdo (limites de texto, truncamento).
- Acessibilidade (role, labels, foco, teclado, contraste).

### 5. Gerar o DESIGN.md

Use `references/design-system-template.md` como estrutura. O documento deve ser auto-suficiente: outra pessoa ou agente deve conseguir implementar a UI apenas com ele.

Inclua obrigatoriamente:

- Resumo visual e princípios.
- Tabela de tokens com valores e uso.
- Escala tipográfica.
- Especificações de componentes.
- Layout e breakpoints.
- Regras de acessibilidade.
- Bloco de tokens em CSS custom properties e/ou JSON.
- Premissas e lacunas.

### 6. Gerar prompts de implementação

Para cada tela ou componente, produza um prompt pronto para um agente de código usando `references/implementation-prompt.md`. O prompt deve conter:

- Objetivo e stack.
- Tokens relevantes (não apenas "use o design system").
- Estrutura de layout e hierarquia.
- Contratos de componentes e estados.
- Conteúdo/copy.
- Restrições de responsividade, acessibilidade e performance.
- Critérios de aceite verificáveis.

### 7. Validar

Antes de entregar, verifique:

- [ ] Todos os tokens usados nos prompts existem no DESIGN.md.
- [ ] Contraste AA nos pares texto/fundo.
- [ ] Estados de foco visíveis e navegação por teclado descrita.
- [ ] Escala de espaçamento e tipografia sem valores órfãos.
- [ ] Componentes com variantes e estados completos.
- [ ] Breakpoints e comportamento mobile definidos.
- [ ] Premissas e incertezas explicitadas.

## Formato de entrega

Crie os arquivos no projeto (salvo instrução contrária):

```
design-system/
├── DESIGN.md
├── tokens.css
├── tokens.json
└── prompts/
    ├── <tela-1>.md
    └── <tela-2>.md
```

Se o projeto já tiver uma pasta de design system, adapte os caminhos.

## Anti-padrões

- Inventar medidas exatas a partir de uma imagem sem sinalizar a aproximação.
- Criar dezenas de tons sem papéis semânticos.
- Copiar a estética sem garantir acessibilidade.
- Entregar apenas uma lista de cores, sem componentes, estados e layout.
- Gerar prompts vagos ("siga o design system") em vez de tokens explícitos.
- Ignorar dark mode, responsividade ou estados de erro quando o produto exigir.

## Referências

- `references/design-system-template.md`: estrutura do DESIGN.md.
- `references/implementation-prompt.md`: template de prompt de implementação.

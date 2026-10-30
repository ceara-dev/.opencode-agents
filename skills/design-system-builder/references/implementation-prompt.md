# Template — Prompt de implementação

Preencha e entregue um prompt por tela ou componente. Substitua todos os campos entre colchetes; não deixe instruções vagas.

---

## Objetivo

Implemente [tela/componente] para [produto], usando [stack]. O resultado deve corresponder ao sistema de design em `design-system/DESIGN.md` e à referência visual fornecida.

## Contexto

- Produto: [descrição curta]
- Público: [quem usa]
- Tela/fluxo: [nome e propósito]
- Stack: [React + Vite + Tailwind, Flutter, HTML/CSS, etc.]
- Dependências permitidas: [lista]
- O que não usar: [ex.: bibliotecas de UI externas, gradientes, sombras pesadas]

## Direção visual

- Adjetivos: [3–5]
- Densidade: [compacta/equilibrada/arejada]
- Referência: [arquivo ou link]
- Elemento assinatura: [ex.: tipografia display grande, grid editorial, bordas finas]

## Tokens

Use exatamente estes valores:

```css
--color-bg-canvas: [valor];
--color-bg-surface: [valor];
--color-text-primary: [valor];
--color-text-muted: [valor];
--color-action-primary: [valor];
--color-action-primary-hover: [valor];
--color-border-default: [valor];
--color-focus-ring: [valor];
--font-sans: [stack];
--text-h1: [valor];
--text-body: [valor];
--space-4: [valor];
--radius-md: [valor];
```

Tipografia:

| Elemento | Token | Tamanho | Peso | Line-height |
| --- | --- | --- | --- | --- |
| Título | | | | |
| Corpo | | | | |
| Rótulo | | | | |

## Layout

- Container: [largura máxima] com padding lateral de [valor].
- Grid: [colunas e gaps].
- Ordem dos blocos: [lista].
- Comportamento responsivo:
  - Mobile (<640px): [descrição]
  - Tablet (640–1023px): [descrição]
  - Desktop (≥1024px): [descrição]

## Componentes

Para cada componente, implemente as variantes e estados listados.

### [Componente]

- Anatomia:
- Variantes:
- Tamanhos:
- Estados: default, hover, active, focus-visible, disabled, loading, error
- Conteúdo:
- Acessibilidade:

## Conteúdo

- Título:
- Subtítulo:
- CTA primário:
- CTA secundário:
- Itens de lista/cards:
- Textos de apoio:

Use copy em [idioma], tom [tom], sem lorem ipsum.

## Interações

- [Ação] → [resultado]
- Foco inicial:
- Ordem de tabulação:
- Feedback de envio:
- Estados vazios/erro:

## Acessibilidade

- Contraste mínimo AA.
- Landmarks semânticos e headings em ordem.
- Labels explícitos em todos os campos.
- Foco visível com anel de [valor].
- Alvos de toque com no mínimo 44×44px.
- Respeitar `prefers-reduced-motion`.

## Critérios de aceite

- [ ] A tela usa apenas os tokens listados; nenhum valor de cor/tamanho órfão.
- [ ] Layout funcional em 360px, 768px e 1280px.
- [ ] Todos os estados interativos implementados.
- [ ] Navegação por teclado completa e foco visível.
- [ ] Contraste AA validado nos pares texto/fundo.
- [ ] Sem dependências não autorizadas.
- [ ] Build/lint sem erros.

## Entrega

- Arquivos: [caminhos]
- Como executar: [comando]
- O que validar manualmente: [lista curta]

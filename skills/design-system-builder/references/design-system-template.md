# DESIGN.md — [Nome do Produto]

> Fonte: [imagens/links de referência]
> Plataforma: [Web / Mobile / Desktop]
> Stack alvo: [React + Tailwind / Flutter / HTML + CSS / outra]
> Status: [rascunho / validado]

## 1. Contexto e objetivo

- Produto:
- Público:
- Objetivo principal da interface:
- Referências analisadas:

## 2. Tese visual

- Adjetivos: [ex.: editorial, sóbrio, denso, preciso]
- Personalidade:
- Densidade: [compacta / equilibrada / arejada]
- Inspirações declaradas:
- O que evitar:

## 3. Cores

### 3.1 Primitivas

| Token | Valor | Uso |
| --- | --- | --- |
| `color.neutral.0` | `#FFFFFF` | |
| `color.neutral.50` | `#F8FAFC` | |
| `color.neutral.100` | `#F1F5F9` | |
| `color.neutral.300` | `#CBD5E1` | |
| `color.neutral.500` | `#64748B` | |
| `color.neutral.700` | `#334155` | |
| `color.neutral.900` | `#0F172A` | |
| `color.accent.500` | `#2563EB` | |
| `color.accent.600` | `#1D4ED8` | |
| `color.success.500` | `#16A34A` | |
| `color.warning.500` | `#D97706` | |
| `color.danger.500` | `#DC2626` | |

### 3.2 Semânticas

| Token | Valor | Uso |
| --- | --- | --- |
| `color.bg.canvas` | | Fundo principal |
| `color.bg.surface` | | Cards e painéis |
| `color.bg.subtle` | | Faixas e seções alternadas |
| `color.text.primary` | | Texto principal |
| `color.text.muted` | | Texto secundário |
| `color.text.inverse` | | Texto sobre acento |
| `color.border.default` | | Bordas e divisores |
| `color.action.primary` | | CTA principal |
| `color.action.primary-hover` | | Hover do CTA |
| `color.focus.ring` | | Anel de foco |

### 3.3 Pares de contraste

| Texto | Fundo | Rácio | AA |
| --- | --- | --- | --- |
| `color.text.primary` | `color.bg.canvas` | | Sim/Não |
| `color.text.muted` | `color.bg.canvas` | | Sim/Não |
| `color.text.inverse` | `color.action.primary` | | Sim/Não |

## 4. Tipografia

- Display/Headings: `[família]`, fallback `[stack]`
- Corpo: `[família]`, fallback `[stack]`
- Mono (se aplicável): `[família]`, fallback `[stack]`

| Token | Tamanho | Line-height | Peso | Tracking | Uso |
| --- | --- | --- | --- | --- | --- |
| `text.display` | 56px | 1.05 | 700 | -0.02em | Hero |
| `text.h1` | 40px | 1.1 | 700 | -0.02em | Título de página |
| `text.h2` | 32px | 1.2 | 650 | -0.01em | Seção |
| `text.h3` | 24px | 1.3 | 600 | 0 | Subseção |
| `text.body` | 16px | 1.6 | 400 | 0 | Corpo |
| `text.small` | 14px | 1.5 | 400 | 0 | Apoio |
| `text.caption` | 12px | 1.4 | 500 | 0.02em | Rótulos |

## 5. Espaçamento e layout

- Unidade-base: `4px`
- Escala: `2, 4, 8, 12, 16, 24, 32, 48, 64, 96, 128`
- Container máximo: `1200px`
- Gutters: `24px` mobile, `32px` desktop
- Grid: `4` colunas mobile, `8` tablet, `12` desktop

| Breakpoint | Largura | Comportamento |
| --- | --- | --- |
| `sm` | 640px | |
| `md` | 768px | |
| `lg` | 1024px | |
| `xl` | 1280px | |

## 6. Formas, bordas e elevação

| Token | Valor | Uso |
| --- | --- | --- |
| `radius.sm` | 6px | Inputs e botões pequenos |
| `radius.md` | 10px | Cards |
| `radius.lg` | 16px | Modais e superfícies grandes |
| `radius.full` | 9999px | Pills e avatares |
| `border.width` | 1px | Padrão |
| `shadow.sm` | `0 1px 2px rgba(15,23,42,.08)` | Cards em repouso |
| `shadow.md` | `0 8px 24px rgba(15,23,42,.12)` | Dropdowns |
| `shadow.lg` | `0 24px 48px rgba(15,23,42,.18)` | Modais |

## 7. Iconografia e imagens

- Estilo de ícone: [outline / filled / duotone]
- Biblioteca: [Lucide / Material Symbols / custom]
- Tamanhos: 16, 20, 24
- Tratamento de imagens:
- Proporções:

## 8. Movimento

| Token | Duração | Easing | Uso |
| --- | --- | --- | --- |
| `motion.fast` | 120ms | `ease-out` | Hover e foco |
| `motion.base` | 200ms | `ease-out` | Transições de UI |
| `motion.slow` | 320ms | `cubic-bezier(.2,.8,.2,1)` | Entradas e modais |

Respeitar `prefers-reduced-motion`.

## 9. Componentes

Para cada componente: anatomia, variantes, tamanhos, estados, responsividade e acessibilidade.

### 9.1 Button

- Variantes: primary, secondary, ghost, danger
- Tamanhos: sm (32px), md (40px), lg (48px)
- Estados: default, hover, active, focus-visible, disabled, loading
- Raio: `radius.sm`
- Tipografia: `text.small` (600)
- Acessibilidade: alvo mínimo 44×44px em touch, foco visível

### 9.2 Input

- Altura: 40px
- Estados: default, hover, focus, filled, error, disabled
- Label sempre visível; placeholder é apoio, não rótulo
- Mensagem de erro associada via `aria-describedby`

### 9.3 Card

- Padding: `space.6`
- Borda: `color.border.default`
- Raio: `radius.md`
- Sombra: `shadow.sm`

### 9.4 Navegação

- Estrutura:
- Item ativo:
- Comportamento mobile:

### 9.5 Outros componentes

- Badge:
- Avatar:
- Modal:
- Tabela:
- Toast:

## 10. Padrões

- Formulários:
- Feedback e validação:
- Loading, vazio e erro:
- Navegação:
- Confirmação de ações destrutivas:

## 11. Acessibilidade

- Contraste: mínimo AA.
- Foco: `focus-visible` com anel de 2px e offset de 2px.
- Teclado: ordem lógica, sem armadilhas de foco.
- Semântica: landmarks, headings hierárquicos, labels.
- Movimento: respeitar `prefers-reduced-motion`.
- Texto: não usar cor como único indicador.

## 12. Tokens de implementação

### 12.1 CSS custom properties

```css
:root {
  --color-bg-canvas: #ffffff;
  --color-bg-surface: #f8fafc;
  --color-bg-subtle: #f1f5f9;
  --color-text-primary: #0f172a;
  --color-text-muted: #64748b;
  --color-text-inverse: #ffffff;
  --color-border-default: #e2e8f0;
  --color-action-primary: #2563eb;
  --color-action-primary-hover: #1d4ed8;
  --color-focus-ring: #93c5fd;

  --font-sans: ui-sans-serif, system-ui, -apple-system, "Segoe UI", sans-serif;
  --font-mono: ui-monospace, SFMono-Regular, Menlo, monospace;

  --text-display: 3.5rem;
  --text-h1: 2.5rem;
  --text-h2: 2rem;
  --text-h3: 1.5rem;
  --text-body: 1rem;
  --text-small: 0.875rem;
  --text-caption: 0.75rem;

  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-6: 1.5rem;
  --space-8: 2rem;
  --space-12: 3rem;
  --space-16: 4rem;
  --space-24: 6rem;

  --radius-sm: 0.375rem;
  --radius-md: 0.625rem;
  --radius-lg: 1rem;
  --radius-full: 9999px;

  --shadow-sm: 0 1px 2px rgb(15 23 42 / 0.08);
  --shadow-md: 0 8px 24px rgb(15 23 42 / 0.12);
  --shadow-lg: 0 24px 48px rgb(15 23 42 / 0.18);

  --motion-fast: 120ms;
  --motion-base: 200ms;
  --motion-slow: 320ms;
}
```

### 12.2 JSON

```json
{
  "color": {
    "bg": { "canvas": "#ffffff", "surface": "#f8fafc", "subtle": "#f1f5f9" },
    "text": { "primary": "#0f172a", "muted": "#64748b", "inverse": "#ffffff" },
    "border": { "default": "#e2e8f0" },
    "action": { "primary": "#2563eb", "primaryHover": "#1d4ed8" },
    "focus": { "ring": "#93c5fd" }
  },
  "font": {
    "sans": "ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif",
    "mono": "ui-monospace, SFMono-Regular, Menlo, monospace"
  },
  "space": { "1": "0.25rem", "2": "0.5rem", "3": "0.75rem", "4": "1rem", "6": "1.5rem", "8": "2rem", "12": "3rem", "16": "4rem", "24": "6rem" },
  "radius": { "sm": "0.375rem", "md": "0.625rem", "lg": "1rem", "full": "9999px" }
}
```

## 13. Premissas e lacunas

- [assumido] ...
- [pendente] ...
- [precisa de validação com o usuário] ...

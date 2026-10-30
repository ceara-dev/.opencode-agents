---
name: landing-page-scaffold
description: "Gera um protótipo de landing page em um único arquivo HTML autocontido, com estilos embutidos e as cinco seções padrão Hero → Prova Social → Recursos → Preços → CTA. Use quando o usuário pedir para construir, gerar ou montar uma landing page, wireframe, página de marketing ou protótipo de página, ou mencionar seções como hero, prova social, recursos, preços ou CTA. Triggers: landing page, página de vendas, marketing page, wireframe, hero, pricing, call to action, protótipo HTML."
---

# Landing Page Scaffold

Gera uma landing page completa em um único arquivo HTML, com CSS embutido, sem build e sem dependências externas obrigatórias. O resultado deve abrir diretamente no navegador e servir como base visual e de copy para um MVP.

## Quando usar

- O usuário pede para criar, gerar ou montar uma landing page.
- O usuário pede um wireframe ou protótipo de página de marketing.
- O usuário menciona seções como hero, prova social, recursos, preços ou CTA.
- O usuário quer validar posicionamento, copy e hierarquia visual rapidamente.

Não use para: aplicações com múltiplas rotas, dashboards, designs que exigem backend, ou quando o usuário pede explicitamente React/Vue/Next — nesse caso, adapte a abordagem ou pergunte.

## Brief mínimo

Reúna o essencial em uma única rodada de perguntas. Se o usuário não fornecer, assuma padrões plausíveis, declare as suposições e entregue.

1. Produto e proposta de valor em uma frase.
2. Público-alvo.
3. Ação principal desejada (CTA).
4. Tom visual e preferências de cor/fonte (ou "decida por mim").
5. Idioma e tom de voz.

Opcional: nome da marca, preços, depoimentos, logos, métricas, links.

## Estrutura obrigatória

A página deve conter, nesta ordem:

1. **Hero** — eyebrow opcional, H1 com a proposta de valor, subheadline, CTA primário, CTA secundário opcional e um elemento visual ou prova rápida.
2. **Prova Social** — logos, métricas, depoimentos ou combinação. Deve ser crível e específica.
3. **Recursos** — 3 a 6 cards ou blocos alternados com benefício, título e descrição.
4. **Preços** — 2 ou 3 planos, um destacado, com lista de recursos e CTA por plano.
5. **CTA final** — headline de fechamento, subheadline e botão principal.

Inclua navegação mínima no topo e footer enxuto, a menos que o usuário peça sua ausência.

## Regras de implementação

- Um único arquivo `.html` com `<style>` embutido; nenhum build step.
- Sem dependências externas obrigatórias. Prefira fontes do sistema (`ui-sans-serif`, `system-ui`) e ícones em SVG inline.
- Se usar uma fonte externa, limite a uma família e sempre defina fallback.
- Mobile-first; valide em 360px, 768px e 1280px.
- Use CSS custom properties para cores, tipografia, espaçamento e raios.
- HTML semântico: `header`, `nav`, `main`, `section`, `footer`, headings em ordem.
- Acessibilidade: contraste AA, foco visível, labels, `alt` em imagens, alvos de toque ≥44px, `prefers-reduced-motion`.
- Sem lorem ipsum: escreva copy real e específica.
- Sem imagens quebradas: use gradientes, formas CSS ou placeholders SVG inline.

## Direção de design

Escolha uma direção clara e execute com consistência:

- **Editorial**: tipografia grande, muito espaço em branco, contraste forte, bordas finas.
- **SaaS moderno**: fundo claro, acento vibrante, cards suaves, gradientes discretos.
- **Premium/escuro**: fundo profundo, tipografia clara, detalhes em dourado ou neon.
- **Minimal**: paleta neutra, hierarquia por escala e peso, quase sem decoração.

Defina: paleta (1 cor de ação + neutros + 1 acento), par tipográfico, escala de espaçamento e raio. Evite misturar mais de duas famílias tipográficas.

## Copy

- H1: benefit-led, específico, até ~10 palavras.
- Subheadline: como funciona e para quem, em 1–2 frases.
- CTAs: verbo + resultado ("Começar grátis", "Ver planos").
- Recursos: benefício antes do mecanismo.
- Prova social: números, nomes e contexto; evite elogios genéricos.
- Preços: nomes de plano claros, âncora de valor e um plano recomendado.

Consulte `references/section-blueprint.md` para detalhes de cada seção e `assets/landing-page-template.html` para o esqueleto base.

## Saída

Salve em `landing-pages/<slug>.html` (ou no caminho indicado pelo usuário) e informe como abrir:

```bash
xdg-open landing-pages/<slug>.html
```

Se o ambiente permitir, abra a página no navegador e verifique visualmente.

## Validação

- [ ] Todos os cinco blocos presentes e na ordem correta.
- [ ] Copy específica, sem placeholders óbvios.
- [ ] Layout íntegro em 360px, 768px e 1280px.
- [ ] Nenhum recurso externo quebrando offline.
- [ ] Contraste AA e foco visível.
- [ ] CTAs com `href` funcionais ou âncoras internas válidas.
- [ ] Arquivo único, sem erros no console.

## Anti-padrões

- Entregar CSS e HTML em arquivos separados quando o pedido é um protótipo único.
- Usar lorem ipsum ou copy genérica.
- Empilhar gradientes, sombras e animações sem hierarquia.
- Ignorar mobile ou acessibilidade.
- Criar planos de preço sem diferenciação real.
- Deixar links e CTAs apontando para `#` sem indicação.

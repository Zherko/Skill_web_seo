# Skill_Web_SEO — `/skill_web_seo`

> **Comando actual:** `/skill_web_seo` · **Comando anterior (obsoleto):** `/seo` → ahora redirige a `/skill_web_seo`

## Instalación y Uso

**Cómo invocar esta skill tras instalarla:**

1. **Comando slash (recomendado):** escribe `/skill_web_seo` seguido de tu petición.
   - Ejemplos:
     - `/skill_web_seo audita la home para crawlability e indexability`
     - `/skill_web_seo genera el llms.txt y el bloque de AI crawlers para robots.txt`
     - `/skill_web_seo optimiza title/meta/OG/schema de /tours/cenote.html`

2. **Lenguaje natural:** también se activa si dices "audita SEO", "mejora el SEO", "revisa structured data / sitemap / robots / canónicos / Core Web Vitals / keyword mapping".

**Instalación:**
- Ruta instalada: `~/.config/opencode/skills/skill_web_seo/` (esta carpeta). Al estar presente, `/skill_web_seo` queda disponible automáticamente — no requiere configuración extra. Verifica con `/help` o listando skills.
- Si migras desde la versión antigua `seo`, elimina o renombra `~/.config/opencode/skills/seo/` y usa solo `skill_web_seo` para evitar duplicados. El comando `/seo` ya no es válido.

**Nota de compatibilidad:** `/seo` fue renombrado a `/skill_web_seo` para alinearse con la convención `skill_*`. Actualiza tus atajos, docs y comandos personalizados.

---

Improve search visibility through technical correctness, performance, content relevance, and AI citability — not gimmicks.

## When to Use

Use this skill when:
- auditing crawlability, indexability, canonicals, or redirects
- improving title tags, meta descriptions, and heading structure
- adding or validating structured data
- improving Core Web Vitals
- doing keyword research and mapping keywords to URLs
- planning internal linking or sitemap / robots changes

## How It Works

### Principles

1. Fix technical blockers before content optimization.
2. One page should have one clear primary search intent.
3. Prefer long-term quality signals over manipulative patterns.
4. Mobile-first assumptions matter because indexing is mobile-first.
5. Recommendations should be page-specific and implementable.

### Technical SEO checklist

#### Crawlability

- `robots.txt` should allow important pages and block low-value surfaces
- no important page should be unintentionally `noindex`
- important pages should be reachable within a shallow click depth
- avoid redirect chains longer than two hops
- canonical tags should be self-consistent and non-looping

#### Indexability

- preferred URL format should be consistent
- multilingual pages need correct hreflang if used
- sitemaps should reflect the intended public surface
- no duplicate URLs should compete without canonical control

#### Performance

- LCP < 2.5s
- INP < 200ms
- CLS < 0.1
- common fixes: preload hero assets, reduce render-blocking work, reserve layout space, trim heavy JS

#### Structured data

- homepage: organization or business schema where appropriate
- editorial pages: `Article` / `BlogPosting`
- product pages: `Product` and `Offer`
- interior pages: `BreadcrumbList`
- Q&A sections: `FAQPage` only when the content truly matches

### On-page rules

#### Title tags

- aim for roughly 50-60 characters
- put the primary keyword or concept near the front
- make the title legible to humans, not stuffed for bots

#### Meta descriptions

- aim for roughly 120-160 characters
- describe the page honestly
- include the main topic naturally

#### Heading structure

- one clear `H1`
- `H2` and `H3` should reflect actual content hierarchy
- do not skip structure just for visual styling

### Keyword mapping

1. define the search intent
2. gather realistic keyword variants
3. prioritize by intent match, likely value, and competition
4. map one primary keyword/theme to one URL
5. detect and avoid cannibalization

### Internal linking

- link from strong pages to pages you want to rank
- use descriptive anchor text
- avoid generic anchors when a more specific one is possible
- backfill links from new pages to relevant existing ones

### Internal linking checklist (CRITICAL)

Every page MUST have internal links to related content:

#### For tour/activity pages:
- Add "Related Tours" section with 3-4 related tours
- Link to parent category page (e.g., /tours)
- Link from blog posts to relevant tours
- Link from homepage to all main tours

#### For blog/article pages:
- Add "Related Articles" section with 3-4 related posts
- Link to relevant tour pages within content
- Link to category pages if applicable

#### For main pages (home, tours, rent, blog):
- Link to all child pages
- Include featured content sections
- Add breadcrumbs for navigation

#### Linking structure requirements:
```
Homepage → All main pages (tours, rent, blog)
Tour pages → Related tours (3-4)
Tour pages → Parent tours page
Blog posts → Related posts (3-4)
Blog posts → Relevant tour pages
All pages → Homepage (via logo/nav)
All pages → Main navigation (tours, rent, blog)
```

#### Minimum internal links per page type:
- Homepage: 10+ (nav + featured content)
- Tour pages: 5+ (nav + related tours + parent)
- Blog posts: 5+ (nav + related posts + tour links)
- Rent pages: 4+ (nav + vehicle links)

### Image SEO checklist

- every image must have descriptive `alt` text
- filenames should be descriptive (e.g., `senggigi-beach-sunset.jpg` not `9e2931_abc123.jpg`)
- add `width` and `height` attributes to prevent CLS
- use `loading="lazy"` for below-the-fold images
- compress images for faster loading

## Examples

### Title formula

```text
Primary Topic - Specific Modifier | Brand
```

### Meta description formula

```text
Action + topic + value proposition + one supporting detail
```

### JSON-LD example

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Page Title Here",
  "author": {
    "@type": "Person",
    "name": "Author Name"
  },
  "publisher": {
    "@type": "Organization",
    "name": "Brand Name"
  }
}
```

### Audit output shape

```text
[HIGH] Duplicate title tags on product pages
Location: src/routes/products/[slug].tsx
Issue: Dynamic titles collapse to the same default string, which weakens relevance and creates duplicate signals.
Fix: Generate a unique title per product using the product name and primary category.
```

## Anti-Patterns

| Anti-pattern | Fix |
| --- | --- |
| keyword stuffing | write for users first |
| thin near-duplicate pages | consolidate or differentiate them |
| schema for content that is not actually present | match schema to reality |
| content advice without checking the actual page | read the real page first |
| generic "improve SEO" outputs | tie every recommendation to a page or asset |

## Related Skills

- `seo-specialist`
- `frontend-patterns`
- `brand-voice`
- `market-research`

## Common SEO Audit Oversights (Lessons Learned)

These are frequently missed items during SEO audits:

| Oversight | Why It Matters | How to Avoid |
|-----------|---------------|--------------|
| **Missing internal links** | Pages become orphaned, Google can't discover them | Always check "Related Tours/Articles" sections |
| **Relative canonical URLs** | Don't resolve correctly | Always use absolute URLs (https://...) |
| **Missing og:locale** | Social sharing incomplete | Add `og:locale` to all pages |
| **Corrupted meta keywords** | Hurts relevance signals | Verify keywords are clean text |
| **Missing width/height on images** | Causes CLS, hurts Core Web Vitals | Always add explicit dimensions |
| **Generic image filenames** | Misses image SEO opportunities | Use descriptive names like `senggigi-beach.jpg` |
| **Missing favicon set** | Looks unprofessional, affects branding | Add 32x32, 192x192, apple-touch-icon |
| **No preload for critical fonts** | Slows initial render | Add `<link rel="preconnect">` for Google Fonts |
| **Missing meta robots** | Unclear indexing intent | Add `<meta name="robots" content="index, follow">` |
| **Blog posts with href="#"** | Wasted link equity | Always use real URLs |

### Quick SEO Audit Checklist

Before declaring SEO work complete, verify:

- [ ] All pages have unique title tags (50-60 chars)
- [ ] All pages have meta descriptions (120-160 chars)
- [ ] All pages have canonical URLs (absolute, not relative)
- [ ] All pages have Open Graph tags (title, description, image, url, locale)
- [ ] All pages have Twitter Card tags
- [ ] All pages have hreflang if multilingual
- [ ] All pages have BreadcrumbList schema
- [ ] Homepage has LocalBusiness/Organization schema
- [ ] Blog posts have Article schema
- [ ] All images have alt text
- [ ] All images have width/height attributes
- [ ] All images have descriptive filenames
- [ ] Every page has 3+ internal links to related content
- [ ] No broken links (href="#" or non-existent pages)
- [ ] robots.txt exists and references sitemap
- [ ] sitemap.xml includes all public pages
- [ ] Favicon set is complete
- [ ] CSS/JS are minified
- [ ] Critical fonts have preconnect hints
- [ ] `llms.txt` exists at site root with business summary
- [ ] `robots.txt` allows AI crawlers (GPTBot, ClaudeBot, etc.)
- [ ] All tours/products have Schema.org with prices
- [ ] Contact info (WhatsApp/email) visible on every page
- [ ] Content includes factual claims with specific numbers

---

## AI SEO & Citability

Optimize for being cited as a source by AI assistants (ChatGPT, Gemini, Claude, Perplexity), not just ranked by search engines.

### Core Concept

AI SEO ≠ ranking in AI results. AI SEO = **being cited as a trustworthy source** in AI-generated answers. LLMs synthesize from multiple sources; they don't rank pages like Google.

### llms.txt

A machine-readable summary of your site for AI crawlers. Similar to robots.txt but for LLMs.

**Location:** `https://yourdomain.com/llms.txt`

**Structure:**
```text
# Site Name

> One-line description of what the site does.

## About
Brief description of the business, location, services.

## Services/Products
- Service Name - Price/Description
- Service Name - Price/Description

## Contact
- WhatsApp: +XX-XXX-XXX-XXXX
- Email: contact@example.com
- Location: City, Country

## Key Facts
- Fact 1
- Fact 2
```

**Rules:**
- Keep it under 500 lines
- Use plain text, no HTML
- Include real prices and contact info
- Update when services change
- Place at site root

### AI Crawler Permissions

Add explicit permissions for AI crawlers in `robots.txt`:

```text
User-agent: GPTBot
Allow: /

User-agent: ChatGPT-User
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: CCBot
Allow: /

User-agent: anthropic-ai
Allow: /

User-agent: ClaudeBot
Allow: /
```

**Why:** Many AI crawlers default to blocking if not explicitly allowed. Without these permissions, your content may be invisible to AI assistants.

### Content Optimization for AI Extraction

LLMs prefer content that is:
- **Structured:** Lists, tables, definitions, Q&A format
- **Factual:** Specific numbers, prices, dates (not vague claims)
- **Self-contained:** Answers questions without requiring clicks
- **Conversational:** Written as if answering a question directly

**For tour/activity pages:**
- Include exact prices, duration, what's included/excluded
- Use "What is X?" / "How to book X" sections
- Add comparison tables (Tour A vs Tour B)

**For blog posts:**
- Lead with the answer (inverted pyramid)
- Use bullet points for key facts
- Include "Key Takeaways" or "Quick Facts" sections

### Schema.org for AI

Schema.org helps LLMs extract structured data. Prioritize these types for AI visibility:

| Type | Use For | Priority |
|------|---------|----------|
| `LocalBusiness` | Homepage, contact info | HIGH |
| `TouristTrip` | Tour pages with prices | HIGH |
| `BlogPosting` | Blog articles | HIGH |
| `FAQPage` | Q&A sections | MEDIUM |
| `HowTo` | Step-by-step guides | MEDIUM |
| `Product` | Rental items with prices | MEDIUM |
| `BreadcrumbList` | Navigation structure | LOW |

**Key fields for AI extraction:**
- `name`, `description`, `url` (always)
- `price`, `priceCurrency` (for services/products)
- `telephone`, `email` (for contact)
- `address` (for location)

### Brand Mentions & Citations

LLMs cite sources they trust. Build citability through:

1. **Consistent brand name** across all pages and structured data
2. **Unique data** competitors don't have (original prices, local knowledge)
3. **Factual claims** that can be verified (not marketing fluff)
4. **Multiple page references** to the same facts (reinforces truthfulness)

### AI SEO Audit Checklist

- [ ] `llms.txt` exists at site root
- [ ] `robots.txt` explicitly allows AI crawlers (GPTBot, ClaudeBot, etc.)
- [ ] All tours/products have structured data with prices
- [ ] Contact info (WhatsApp, email) is visible on every page
- [ ] Content includes factual claims with specific numbers
- [ ] Blog posts lead with answers, not introductions
- [ ] Comparison tables exist for tour/product comparisons
- [ ] Brand name is consistent across all pages and schema
- [ ] No content is hidden behind JavaScript-only rendering
- [ ] Key facts are repeated across relevant pages (reinforcement)

### Measuring AI SEO Success

Traditional metrics don't apply. Track:
- **AI Citations:** Search your brand in ChatGPT/Gemini/Perplexity
- **AI Referral Traffic:** Monitor direct traffic spikes after AI queries
- **Schema Validation:** Use Google Rich Results Test
- **llms.txt Freshness:** Update monthly with current prices/services

### Anti-Patterns for AI SEO

| Anti-pattern | Fix |
| --- | --- |
| Content only in images | Add text equivalents; LLMs can't read images |
| Hidden contact info | Show WhatsApp/email on every page |
| Blocking AI crawlers in robots.txt | Explicitly allow GPTBot, ClaudeBot, etc. |
| Vague claims ("best tours") | Use specific facts ("16 tours, from Rp325,000") |
| No structured data | Add Schema.org for all tours, products, articles |

---

## Static HTML Blog Pattern

A lightweight, SEO-optimized blog architecture using plain HTML files — no CMS, no database, no build step. Ideal for sites with low-to-medium publishing volume (1-10 articles/month) that prioritize speed, security, and zero maintenance.

### When to Use

- Portfolio/business sites with 3-20 blog articles
- Technical/niche blogs with evergreen content
- Projects where hosting cost and maintenance must be minimal
- Sites where Page Speed and security are critical (no PHP/WordPress attack surface)

### When NOT to Use

- High-volume publishing (20+ articles/month) — consider Astro, 11ty, or WordPress
- Multi-author blogs with role-based workflows
- Sites needing scheduled publishing, drafts, or editorial pipelines
- Community features (comments, user accounts)

### File Structure

```
web/
├── index.html                  # Main site page
├── blog/
│   ├── index.html              # Blog listing (cards generated via JS)
│   ├── blog.css                # Blog-specific styles
│   ├── data.js                 # Article metadata (JS array)
│   ├── article-slug-1.html     # Individual article
│   ├── article-slug-2.html     # Individual article
│   └── ...
├── sitemap.xml                 # All public URLs
├── robots.txt                  # Crawler rules + AI crawlers
├── rss.xml                     # RSS feed
├── llms.txt                    # AI-readable site summary
├── style.css                   # Global styles
├── translations.js             # i18n (if multilingual)
└── css/
    ├── reset.css
    ├── responsive.css
    └── animations.css
```

### data.js — Article Registry

Central registry for the blog listing page. Each article is a JS object:

```js
const BLOG_ARTICLES = [
  {
    id: "article-slug",
    slug: { es: "articulo-slug", en: "article-slug" },
    title: { es: "Título en Español", en: "Title in English" },
    date: "2026-04-02",
    category: { es: "Categoría", en: "Category" },
    tags: ["Tag1", "Tag2", "Tag3"],
    readingTime: { es: "10 min", en: "10 min" },
    excerpt: {
      es: "Breve descripción del artículo en español.",
      en: "Brief article description in English."
    },
    thumbnail: "image-filename.jpg",
    contentFile: "article-slug.html"
  }
];
```

**Rules:**
- One entry per article, ordered newest-first in the listing
- `slug` is used for URL generation — must match the `.html` filename
- `excerpt` is used in listing cards and meta descriptions
- `tags` drive the filter system on the listing page

### Per-Article SEO Checklist

Every article HTML file MUST include ALL of these in `<head>`:

#### 1. Canonical URL (absolute)
```html
<link rel="canonical" href="https://domain.com/blog/article-slug.html">
```

#### 2. Hreflang (if multilingual)
```html
<link rel="alternate" hreflang="es" href="https://domain.com/blog/articulo-slug.html">
<link rel="alternate" hreflang="en" href="https://domain.com/blog/article-slug.html?lang=en">
<link rel="alternate" hreflang="x-default" href="https://domain.com/blog/articulo-slug.html">
```

#### 3. Open Graph
```html
<meta property="og:title" content="Article Title | Brand">
<meta property="og:description" content="Article excerpt.">
<meta property="og:type" content="article">
<meta property="og:url" content="https://domain.com/blog/article-slug.html">
<meta property="og:site_name" content="Brand">
<meta property="og:locale" content="es_ES">
```

#### 4. Twitter Card
```html
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Article Title | Brand">
<meta name="twitter:description" content="Article excerpt.">
```

#### 5. Article Schema (JSON-LD)
```html
<script type="application/ld+json">
{
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": "Article Title",
    "description": "Article excerpt.",
    "datePublished": "2026-04-02",
    "dateModified": "2026-04-02",
    "author": { "@type": "Organization", "name": "Brand" },
    "publisher": { "@type": "Organization", "name": "Brand", "url": "https://domain.com" },
    "mainEntityOfPage": { "@type": "WebPage", "@id": "https://domain.com/blog/article-slug.html" },
    "articleSection": "Category",
    "keywords": ["tag1", "tag2", "tag3"]
}
</script>
```

#### 6. BreadcrumbList Schema
```html
<script type="application/ld+json">
{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": "Inicio", "item": "https://domain.com/" },
        { "@type": "ListItem", "position": 2, "name": "Blog", "item": "https://domain.com/blog/" },
        { "@type": "ListItem", "position": 3, "name": "Article Title" }
    ]
}
</script>
```

#### 7. FAQPage Schema (3 Q&A pairs)
```html
<script type="application/ld+json">
{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
        {
            "@type": "Question",
            "name": "Question text?",
            "acceptedAnswer": {
                "@type": "Answer",
                "text": "Direct answer text."
            }
        }
    ]
}
</script>
```

#### 8. HTML FAQ Section (visible, before related articles)
Use `<details>` + `<summary>` for expandable FAQ, styled to match the site:

```html
<section class="article-content" style="max-width:800px; margin:0 auto; padding:0 2rem 2rem;">
    <h2>Preguntas frecuentes</h2>
    <details style="background:rgba(13,25,41,0.5); border:1px solid var(--border-color); border-radius:12px; margin-bottom:0.8rem; padding:1rem 1.2rem;">
        <summary style="cursor:pointer; font-weight:600;">Question text?</summary>
        <p style="color:var(--text-muted); margin-top:0.8rem; line-height:1.7;">Answer text.</p>
    </details>
</section>
```

### Article HTML Template

Complete head section for any new article:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Article Title | Brand</title>
    <meta name="description" content="120-160 char description.">

    <link rel="canonical" href="https://domain.com/blog/article-slug.html">
    <link rel="alternate" hreflang="es" href="https://domain.com/blog/article-slug.html">
    <link rel="alternate" hreflang="en" href="https://domain.com/blog/article-slug.html?lang=en">
    <link rel="alternate" hreflang="x-default" href="https://domain.com/blog/article-slug.html">

    <!-- Open Graph -->
    <meta property="og:title" content="Article Title | Brand">
    <meta property="og:description" content="Article excerpt.">
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://domain.com/blog/article-slug.html">
    <meta property="og:site_name" content="Brand">
    <meta property="og:locale" content="es_ES">

    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Article Title | Brand">
    <meta name="twitter:description" content="Article excerpt.">

    <!-- Schema: Article -->
    <script type="application/ld+json">{ ... }</script>
    <!-- Schema: BreadcrumbList -->
    <script type="application/ld+json">{ ... }</script>
    <!-- Schema: FAQPage -->
    <script type="application/ld+json">{ ... }</script>

    <!-- Fonts, CSS, favicon -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    ...
</head>
```

### Article Body Structure (Inverted Pyramid)

```
<header> with H1, date, reading time, tags
├── "Resumen rápido" (H2) — lead with the answer in bold
├── Supporting paragraphs (details, code, examples)
├── Interactive elements (charts, tabs, calculators)
├── "Preguntas frecuentes" (H2) — 3 expandable FAQ items
├── "Artículos relacionados" (H2) — 3 cards linking to other articles
└── <footer>
```

**Inverted pyramid rule:** The first paragraph after the H1 MUST answer the article's main question directly in bold. LLMs extract from the first paragraphs — make them count.

### Internal Linking Pattern

Every article links to the other 3 articles at the bottom:

```
Article A → B, C, D (related)
Article B → A, C, D (related)
Article C → A, B, D (related)
Article D → A, B, C (related)
```

Plus navigation links: header nav → Blog listing, "Volver al blog" back-link.

### RSS Feed (rss.xml)

Place at site root. Update `lastBuildDate` and add `<item>` entries for each new article:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Brand - Blog</title>
    <description>Blog description.</description>
    <link>https://domain.com/blog/</link>
    <atom:link href="https://domain.com/rss.xml" rel="self" type="application/rss+xml"/>
    <language>es</language>
    <lastBuildDate>Tue, 23 Aug 2026 00:00:00 +0200</lastBuildDate>
    <item>
      <title>Article Title</title>
      <description>Article excerpt.</description>
      <link>https://domain.com/blog/article-slug.html</link>
      <guid isPermaLink="true">https://domain.com/blog/article-slug.html</guid>
      <pubDate>Wed, 02 Apr 2026 00:00:00 +0200</pubDate>
      <category>Category</category>
    </item>
  </channel>
</rss>
```

Add RSS link in blog listing `<head>`:
```html
<link rel="alternate" type="application/rss+xml" title="Blog Brand" href="https://domain.com/rss.xml">
```

### Blog Listing Page (blog/index.html)

Must include:
- BreadcrumbList schema (Home → Blog)
- RSS link in `<head>`
- Cards generated from `data.js` via vanilla JS
- Filter by tags + search input
- No framework needed — simple `renderArticles()` function

### Tracking (Optional)

If the main site uses Supabase analytics with cookie consent, add this snippet before `</body>` in each article:

```html
<script>
(function() {
    var consent = JSON.parse(localStorage.getItem('cookie-consent'));
    if (!consent || !consent.analytics) return;
    fetch('SUPABASE_URL/rest/v1/visits', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'apikey': 'KEY', 'Authorization': 'Bearer KEY' },
        body: JSON.stringify({ page_path: window.location.pathname, user_agent: navigator.userAgent, country: 'Blog' })
    }).catch(function(){});
})();
</script>
```

### New Article Creation Checklist

When adding a new article to this blog pattern:

- [ ] Create `blog/article-slug.html` from template
- [ ] Add entry to `blog/data.js` (id, slug, title, date, category, tags, excerpt)
- [ ] Add `<item>` to `rss.xml`
- [ ] Update `sitemap.xml` with new URL
- [ ] Verify all 7 head elements: canonical, hreflang, OG, Twitter, Article schema, BreadcrumbList schema, FAQPage schema
- [ ] Add 3 FAQ items (HTML + JSON-LD)
- [ ] Add 3 related articles section at bottom
- [ ] Lead with answer (inverted pyramid) in first paragraph
- [ ] Test with Google Rich Results Test
- [ ] Test sharing on social networks (OG validation)

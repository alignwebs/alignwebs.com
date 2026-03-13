# SEO Action Plan — alignwebs.com Homepage
**Keywords:** "Custom Web Application Development" | "GenAI Development"  
**Date:** 2026-03-13 | Reference: FULL-AUDIT-REPORT.md

---

## Phase 1 — Immediate Blockers (Fix Today)

### 1. Add Canonical Tag
**File:** `index.html` — inside `<head>` after line 9  
**Effort:** 2 min | **Impact:** Prevents duplicate indexing of www vs non-www

```html
<link rel="canonical" href="https://www.alignwebs.com/">
```

---

### 2. Rewrite Title Tag to Include Target Keywords
**File:** `index.html` — line 6  
**Effort:** 5 min | **Impact:** Primary ranking signal; currently missing both keywords

```html
<!-- BEFORE -->
<title>ALiGNWEBS - Develop Enterprise & GenAI Applications</title>

<!-- AFTER (63 chars) -->
<title>Custom Web Application Development & GenAI Solutions | ALiGNWEBS</title>
```

---

### 3. Rewrite Meta Description to Include Both Keywords
**File:** `index.html` — lines 7–8  
**Effort:** 5 min | **Impact:** CTR improvement; currently 130 chars & missing keywords

```html
<!-- BEFORE -->
<meta name="description" content="ALiGNWEBS — A Web Development Agency focused in designing and scaling Enterprise level applications and GenAI applications.">

<!-- AFTER (158 chars) -->
<meta name="description" content="ALiGNWEBS delivers custom web application development and GenAI development services for enterprise teams. Scalable, secure, built to last.">
```

---

### 4. Rewrite H1 to Match Target Keywords
**File:** `index.html` — lines 1074–1081  
**Effort:** 10 min | **Impact:** Strongest on-page ranking signal for keyword match

```html
<!-- AFTER -->
<h1 class="hero__title" id="hero-title">
  <span class="hero__line-wrap">
    <em class="hero__line hero__line--1">Custom Web Application</em>
  </span>
  <span class="hero__line-wrap">
    <strong class="hero__line hero__line--2">Development & GenAI Solutions.</strong>
  </span>
</h1>
```

---

### 5. Add 3 JSON-LD Schema Blocks
**File:** `index.html` — just before `</head>` (line 1041)  
**Effort:** 15 min | **Impact:** Unlocks rich results, entity clarity, AI citation eligibility

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "ALiGNWEBS",
  "url": "https://www.alignwebs.com",
  "logo": "https://www.alignwebs.com/images/logo.svg",
  "description": "ALiGNWEBS provides custom web application development and GenAI development services for enterprise clients.",
  "sameAs": [
    "https://www.linkedin.com/company/alignwebs"
  ],
  "founder": {
    "@type": "Person",
    "name": "Gulzar Ahmed",
    "sameAs": "https://www.linkedin.com/in/gulzar-ahmed"
  }
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "ALiGNWEBS",
  "url": "https://www.alignwebs.com",
  "potentialAction": {
    "@type": "SearchAction",
    "target": {
      "@type": "EntryPoint",
      "urlTemplate": "https://www.alignwebs.com/?s={search_term_string}"
    },
    "query-input": "required name=search_term_string"
  }
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "ALiGNWEBS Services",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "item": {
        "@type": "Service",
        "name": "Custom Web Application Development",
        "description": "Mission-critical web platforms tailored to complex enterprise workflows, built for thousands of concurrent users.",
        "provider": { "@type": "Organization", "name": "ALiGNWEBS" }
      }
    },
    {
      "@type": "ListItem",
      "position": 2,
      "item": {
        "@type": "Service",
        "name": "GenAI Development & LLM Integration",
        "description": "Embed conversational agents, semantic search, document intelligence, and autonomous workflows into enterprise products.",
        "provider": { "@type": "Organization", "name": "ALiGNWEBS" }
      }
    },
    {
      "@type": "ListItem",
      "position": 3,
      "item": {
        "@type": "Service",
        "name": "High-Scale Cloud Architecture",
        "description": "Refactor monoliths into scalable microservices designed for millions of requests with single-digit millisecond latency.",
        "provider": { "@type": "Organization", "name": "ALiGNWEBS" }
      }
    }
  ]
}
</script>
```

---

### 6. Fix Incomplete Open Graph & Twitter Card
**File:** `index.html` — lines 10–15  
**Effort:** 10 min | **Impact:** Social sharing previews; LinkedIn unfurls rely on OG tags

```html
<!-- Replace lines 10–15 with: -->
<meta property="og:title" content="Custom Web Application Development & GenAI Solutions | ALiGNWEBS">
<meta property="og:description" content="ALiGNWEBS delivers custom web application development and GenAI development services for enterprise teams.">
<meta property="og:type" content="website">
<meta property="og:url" content="https://www.alignwebs.com/">
<meta property="og:image" content="https://www.alignwebs.com/images/og-cover.jpg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Custom Web Application Development & GenAI Solutions | ALiGNWEBS">
<meta name="twitter:description" content="ALiGNWEBS delivers custom web application development and GenAI development services for enterprise teams.">
<meta name="twitter:image" content="https://www.alignwebs.com/images/og-cover.jpg">
```
> **Note:** Create a 1200×630px `/images/og-cover.jpg` branding image.

---

## Phase 2 — Quick Wins (Fix This Week)

### 7. Add Robots Meta and Explicit Indexing Signal
```html
<meta name="robots" content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1">
```

---

### 8. Inject "Custom Web Application Development" Phrase Into Body Copy

Add the exact keyword phrase at least once naturally in the hero subtitle and once in the services section header:

**Hero subtitle (lines 1082–1085):**
```html
<p class="hero__sub">
  ALiGNWEBS specialises in <strong>custom web application development</strong> and 
  <strong>GenAI development</strong> — designing and scaling enterprise-level products 
  that perform at scale.
</p>
```

---

### 9. Add `width` and `height` to Logo Image (CLS Fix)
```html
<!-- BEFORE -->
<img src="/images/logo.svg" alt="ALiGNWEBS">

<!-- AFTER -->
<img src="/images/logo.svg" alt="ALiGNWEBS" width="120" height="26">
```

---

### 10. Create `robots.txt` with AI Crawler Policy
**File:** `/var/www/alignwebs.com/robots.txt`

```
User-agent: *
Allow: /

# Allow major AI crawlers (opt-in for AI search indexing)
User-agent: GPTBot
Allow: /

User-agent: ClaudeBot
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: Applebot-Extended
Allow: /

Sitemap: https://www.alignwebs.com/sitemap.xml
```

---

### 11. Create `llms.txt` for AI Search Readiness
**File:** `/var/www/alignwebs.com/llms.txt`

```markdown
# ALiGNWEBS

ALiGNWEBS is a web development agency specialising in custom web application development 
and GenAI development for enterprise clients.

## Services
- Custom Web Application Development: Mission-critical platforms for enterprise workflows
- GenAI Development & LLM Integration: Conversational agents, semantic search, document intelligence
- High-Scale Cloud Architecture: Microservices and cloud-native for millions of requests
- Design Systems & UI Engineering: Component libraries and design tokens at scale
- API & Platform Engineering: REST and GraphQL APIs, integration layers

## Contact
- LinkedIn: https://www.linkedin.com/in/gulzar-ahmed
- Website: https://www.alignwebs.com
```

---

### 12. Update H2 to Include Keyword Signal
**File:** `index.html` — line 1131

```html
<!-- BEFORE -->
<h2 class="section__title">
    End-to-end solutions,<br><em>built to last.</em>
</h2>

<!-- AFTER -->
<h2 class="section__title">
    Custom Web Application Development<br><em>& GenAI Solutions.</em>
</h2>
```

---

## Phase 3 — Strategic Improvements (This Month)

### 13. Expand Content to 600+ Words
Add a "Why ALiGNWEBS" prose section (~200 words) between the Services and Process sections. Use this to:
- Include "custom web application development" and "GenAI development" phrases naturally
- Add E-E-A-T signals: founder's 10+ years of experience, named technologies (React, Node.js, LangChain, etc.)
- Lower readability grade level (target Flesch 45–55)

### 14. Create Dedicated Service Landing Pages
- `/services/custom-web-application-development` — Target "Custom Web Application Development" keyword
- `/services/genai-development` — Target "GenAI Development" keyword
- Add these to nav and internal links from homepage cards

### 15. Add E-E-A-T Signals
- Add founder bio section with photo, credentials, and LinkedIn link
- Add a "Clients & Partners" logos section
- Add 2–3 case study cards with measurable outcomes
- Support unverified stats (50+ startups, 98% delivery) with case study links

### 16. Create `sitemap.xml`
**File:** `/var/www/alignwebs.com/sitemap.xml`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.alignwebs.com/</loc>
    <lastmod>2026-03-13</lastmod>
    <changefreq>monthly</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>
```

### 17. Fix SSL Certificate
Ensure the SSL certificate covers both `alignwebs.com` (apex) and `www.alignwebs.com`. Use Let's Encrypt with both SANs. The current cert hostname mismatch blocks script-based audits.

### 18. Extract CSS to External Stylesheet
Move the 1000+ lines of inline CSS to `/css/main.css` and `<link>` it:
```html
<link rel="stylesheet" href="/css/main.css">
```
This enables browser caching (leverage browser cache for repeat visitors).

---

## Summary Priority Matrix

| Priority | Action | Effort | Impact |
|----------|--------|--------|--------|
| 🔴 P1 | Canonical tag | 2 min | High |
| 🔴 P1 | Title tag rewrite | 5 min | High |
| 🔴 P1 | Meta description rewrite | 5 min | High |
| 🔴 P1 | H1 rewrite | 10 min | High |
| 🔴 P1 | JSON-LD schema (3 blocks) | 15 min | High |
| 🔴 P1 | OG + Twitter Card fix | 10 min | Medium |
| ⚠️ P2 | robots.txt + llms.txt | 10 min | Medium |
| ⚠️ P2 | Inject keywords into body | 15 min | High |
| ⚠️ P2 | H2 keyword update | 5 min | Medium |
| ⚠️ P2 | Logo img width/height | 2 min | Low |
| 📋 P3 | Expand content to 600+ words | 2 hrs | High |
| 📋 P3 | Dedicated service pages | 1 day | Very High |
| 📋 P3 | E-E-A-T / case studies | 3 days | High |
| 📋 P3 | sitemap.xml | 15 min | Medium |
| 📋 P3 | SSL cert fix | 30 min | High |
| 📋 P3 | Extract CSS to file | 1 hr | Medium |

---

*Action plan generated by Antigravity SEO Skill — 2026-03-13*

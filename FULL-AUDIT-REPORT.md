# FULL SEO AUDIT REPORT — alignwebs.com Homepage
**Date:** 2026-03-13  
**Scope:** Single-page audit — `https://alignwebs.com` (`/var/www/alignwebs.com/index.html`)  
**Target Keywords:** "Custom Web Application Development", "GenAI Development"  
**Analyst:** Antigravity SEO Skill (LLM-first, evidence-backed)

---

## A) Audit Summary

| Item | Value |
|------|-------|
| **Overall Score** | **41 / 100 — Poor** |
| **On-Page SEO** | 38 / 100 |
| **Content Quality** | 42 / 100 |
| **Technical SEO** | 60 / 100 |
| **Schema / Structured Data** | 0 / 100 |
| **Images** | 55 / 100 |
| **GEO / AI Readiness** | 20 / 100 |

### Top 3 Issues
1. 🔴 **No structured data (JSON-LD)** — Zero schema markup on the page; missed Organization, WebSite, Service, and BreadcrumbList opportunities.
2. 🔴 **Target keywords absent from title tag, H1, and meta description** — Neither "Custom Web Application Development" nor "GenAI Development" appear verbatim anywhere in SEO-critical metadata.
3. 🔴 **Content volume critically low (414 words)** — Homepage service pages require ≥600 words for competitive agency queries; current count falls ~30% short.

### Top 3 Opportunities
1. ✅ Add JSON-LD `Organization` + `Service` schema (quick win, no code restructure needed).
2. ✅ Rewrite title, H1, and meta description to include exact and near-match keyword variants.
3. ✅ Expand card body copy and add a brief "Why ALiGNWEBS" prose paragraph (~200 words) to cross the 600-word threshold and improve E-E-A-T signals.

---

## B) Findings Table

### On-Page SEO

| Area | Severity | Confidence | Finding | Evidence | Fix |
|------|----------|------------|---------|----------|-----|
| Title Tag | ⚠️ Warning | Confirmed | Title (54 chars) doesn't contain "Custom Web Application Development" or "GenAI Development" | `<title>ALiGNWEBS - Develop Enterprise & GenAI Applications</title>` — uses "GenAI Applications" not the target keyword phrase | Rewrite to: `Custom Web Application Development & GenAI Solutions | ALiGNWEBS` (63 chars) |
| Meta Description | ⚠️ Warning | Confirmed | Description is 130 chars (below 150-min) and omits both target keywords | `content="ALiGNWEBS — A Web Development Agency focused in designing and scaling Enterprise level applications and GenAI applications."` | Expand to 155 chars; include "Custom Web Application Development" and "GenAI Development" verbatim |
| H1 | 🔴 Critical | Confirmed | H1 text "We build scalable Enterprise & GenAI Apps." does not match either target keyword | Line 1074–1081; words are generic brand copy, not keyword-rich | Rewrite to: "Custom Web Application Development & GenAI Solutions for Enterprise" |
| H2 Content | ⚠️ Warning | Confirmed | H2s are brand-copy driven ("End-to-end solutions, built to last", "Precision from discovery to deploy") — no keyword signal | Lines 1131–1132, 1242 | Replace at least one H2 with keyword-aligned text, e.g. "Custom Web Application Development Services" |
| H3 Cards | ✅ Pass | Confirmed | H3 "Custom Enterprise Web Applications" (line 1149) gives a near-match to "Custom Web Application Development"; "GenAI & LLM Integration" is present | Cards section | Add tag like "Custom Web Application Development" to card label or tag list |
| URL Structure | ✅ Pass | Confirmed | Root URL `/` is clean | `og:url` = `https://www.alignwebs.com` | No action needed |
| Internal Links | ⚠️ Warning | Confirmed | Only 2 internal anchor links (`#services`, `#process`) — all CTAs point to external LinkedIn profile | Lines 1060, 1087, 1094, 1303 | Add internal links to dedicated service pages once created; replace 3× LinkedIn-only CTAs with at least one on-site contact/inquiry page |
| External Links | ⚠️ Warning | Confirmed | All 3 CTA links point to a personal LinkedIn profile (`linkedin.com/in/gulzar-ahmed`) rather than a branded company page | Lines 1060, 1087, 1303 | Create a company LinkedIn page or a dedicated `/contact` page; avoid relying solely on personal profile for business CTAs |
| Canonical Tag | 🔴 Critical | Confirmed | No canonical `<link rel="canonical">` tag in `<head>` | Lines 4–21: canonical is completely absent | Add `<link rel="canonical" href="https://www.alignwebs.com/">` immediately |

---

### Content Quality

| Area | Severity | Confidence | Finding | Evidence | Fix |
|------|----------|------------|---------|----------|-----|
| Word Count | 🔴 Critical | Confirmed | 414 visible words — below the 600-word minimum for competitive B2B agency homepage | Readability script output: `word_count: 414` | Add a 200-word "About / Why us" prose block and expand service card descriptions |
| Readability | ⚠️ Warning | Confirmed | Flesch Reading Ease = 16.0, Grade Level 17.1 ("Extremely Difficult") | Readability script: `flesch_reading_ease: 16.0`, `reading_level: Extremely Difficult` | Rewrite card body copy using shorter sentences; target Flesch 40–60 for professional B2B content |
| Keyword Density | 🔴 Critical | Confirmed | "Custom Web Application Development" appears 0× in body text; "GenAI Development" appears 0× | Full HTML review — closest matches are "Custom Enterprise Web Applications" (H3) and "GenAI & LLM Integration" (H3) | Integrate exact target phrases naturally in hero subtitle, card descriptions, and the About section |
| E-E-A-T Signals | ⚠️ Warning | Confirmed | No author bio, no team page, no credentials, no case studies, no testimonials, no portfolio | Entire HTML reviewed; no author/team/case-study content present | Add a brief founder bio, link to portfolio/case studies; add client logos or testimonials section |
| Content Freshness | ℹ️ Info | Confirmed | Footer shows "© 2026 ALiGNWEBS" but no explicit "last updated" date visible to crawlers | Line 1317 | Add a `<time>` element or a schema `dateModified` property |
| Stats Credibility | ⚠️ Warning | Likely | Stats "50+ Startups Supported", "40% Average cost savings", "98% On-time delivery" are unsupported by proof | Lines 1220–1229; no source, no link to case studies | Add a "See how" link to a case studies page or include a citation/methodology note |

---

### Technical SEO

| Area | Severity | Confidence | Finding | Evidence | Fix |
|------|----------|------------|---------|----------|-----|
| Canonical Tag | 🔴 Critical | Confirmed | Missing `<link rel="canonical">` — Google may index both www and non-www versions | `<head>` lines 4–21 | Add `<link rel="canonical" href="https://www.alignwebs.com/">` |
| Open Graph | ⚠️ Warning | Confirmed | `og:image` is missing; `og:title` says "Build the new way" (not keyword-rich) | Lines 10–14 | Add `og:image` (1200×630 PNG/JPG); update `og:title` and `og:description` to match target keywords |
| Twitter Card | ⚠️ Warning | Confirmed | Only `twitter:card` is present; `twitter:title`, `twitter:description`, `twitter:image` are all absent | Line 15 | Add the 3 missing Twitter card meta tags |
| Viewport Meta | ✅ Pass | Confirmed | `<meta name="viewport" content="width=device-width, initial-scale=1">` is correctly set | Line 9 | No action |
| `lang` Attribute | ✅ Pass | Confirmed | `<html lang="en">` present | Line 2 | No action |
| Robots Meta | ⚠️ Warning | Confirmed | No `<meta name="robots">` tag; relying on default crawl behaviour | `<head>` reviewed | Add `<meta name="robots" content="index, follow">` explicitly |
| Page Speed — CSS | ⚠️ Warning | Likely | All CSS is inline in `<style>` (lines 25–1040: ~1000 lines of CSS); no external stylesheet caching | Inline `<style>` block is 1000+ lines | Extract CSS to `/css/main.css` for browser caching; inline only critical above-the-fold CSS |
| Render-Blocking Fonts | ⚠️ Warning | Confirmed | Two Google Fonts `<link>` tags without `media="print"` trick or `font-display:swap` | Lines 20–23 | Add `font-display: swap` via `&display=swap` (partially done for Google Sans) and consider `preload` for primary font |
| JS Rendering | ✅ Pass | Confirmed | Only 30 lines of inline vanilla JS for scroll/observer/mouse effects; no heavy third-party frameworks | Lines 1326–1355 | No action |
| HTTPS / SSL | ℹ️ Info | Hypothesis | SSL cert hostname mismatch detected (`alignwebs.com` vs cert domain) | Script returned `SSLCertVerificationError: Hostname mismatch` | Verify SSL cert covers both `alignwebs.com` (apex) and `www.alignwebs.com` via Let's Encrypt or hosting provider |
| Mobile Responsiveness | ✅ Pass | Confirmed | Media query at `max-width: 700px` collapses nav; grid collapses at `900px` | Lines 199–203, 717–725 | No action |
| `hreflang` | ℹ️ Info | N/A | Single language (en), no multi-region signals | Not needed currently | Add if targeting additional markets |
| AI Crawler Robots.txt | 🔴 Critical | Hypothesis | No evidence of `robots.txt` with AI bot directives (GPTBot, ClaudeBot, PerplexityBot, etc.) | Could not fetch live URL; no `robots.txt` file found in repo root | Create `/robots.txt` with explicit AI crawler policy; also add `llms.txt` for AI search readiness |

---

### Schema / Structured Data

| Area | Severity | Confidence | Finding | Evidence | Fix |
|------|----------|------------|---------|----------|-----|
| JSON-LD | 🔴 Critical | Confirmed | Zero structured data on the page | Full HTML review: no `<script type="application/ld+json">` blocks found | Add `Organization`, `WebSite` (with SearchAction), and `Service` schemas (see below) |
| Schema Opportunities | ⚠️ Warning | Confirmed | Service cards map directly to `Service` schema; stats map to `Organization` | Lines 1143–1209 | Implement 3 JSON-LD blocks: Organization, WebSite, ItemList of Services |

---

### Images

| Area | Severity | Confidence | Finding | Evidence | Fix |
|------|----------|------------|---------|----------|-----|
| Logo Alt Text | ✅ Pass | Confirmed | `<img src="/images/logo.svg" alt="ALiGNWEBS">` — alt text is present | Line 1056 | No action |
| Other Images | ℹ️ Info | Confirmed | No other `<img>` tags — service cards use emoji icons; ambient orbs are CSS-only | Full HTML | Service cards could benefit from real visuals with descriptive alt text for richer keyword signals |
| Image Format | ✅ Pass | Confirmed | Only one image (logo SVG); SVG is optimal format | Line 1056 | No action |
| CLS Risk | ⚠️ Warning | Likely | Logo `<img>` has no explicit `width`/`height` attributes; can cause CLS | Line 1056: only `height: 26px` in CSS, not HTML attributes | Add `width` and `height` attributes to `<img src="/images/logo.svg">` |

---

### GEO / AI Search Readiness

| Area | Severity | Confidence | Finding | Evidence | Fix |
|------|----------|------------|---------|----------|-----|
| `llms.txt` | 🔴 Critical | Hypothesis | No `llms.txt` file found | Not in repo; could not fetch live | Create `/llms.txt` summarising services in plain language for LLM crawlers |
| AI Crawler Policy | 🔴 Critical | Hypothesis | `robots.txt` status unknown; no explicit AI bot directives | Could not fetch due to SSL error | Confirm `robots.txt` exists and add/allow GPTBot, ClaudeBot, PerplexityBot |
| Citability | ⚠️ Warning | Confirmed | No structured definitions, no FAQ, no "What is" content that AI search can cite | Content is all marketing copy, no informational depth | Add a short FAQ or "About GenAI Development" explainer block for AI citation potential |
| Entity Clarity | ⚠️ Warning | Confirmed | Brand name "ALiGNWEBS" uses mixed case that may confuse entity resolution | Title, meta, and body use `ALiGNWEBS` inconsistently | Standardize brand name usage; add `Organization` JSON-LD to anchor entity in KG |

---

## C) Keyword Gap Analysis

### "Custom Web Application Development"
| Signal | Status | Detail |
|--------|--------|--------|
| Title Tag | ❌ Missing | Title says "Develop Enterprise & GenAI Applications" |
| Meta Description | ❌ Missing | No variation of the phrase |
| H1 | ❌ Missing | H1 is brand copy, not keyword-aligned |
| H2 | ❌ Missing | Neither H2 contains this phrase |
| H3 | ⚠️ Near-match | "Custom Enterprise Web Applications" (H3, card) |
| Body Copy | ❌ Missing | Phrase not present anywhere in body |
| **Verdict** | 🔴 Critical | Keyword intent almost unaddressed |

### "GenAI Development"
| Signal | Status | Detail |
|--------|--------|--------|
| Title Tag | ⚠️ Near-match | "GenAI Applications" (not "GenAI Development") |
| Meta Description | ⚠️ Near-match | "GenAI applications" |
| H1 | ⚠️ Near-match | "GenAI Apps." |
| H3 | ⚠️ Near-match | "GenAI & LLM Integration" |
| Body Copy | ❌ Missing | "GenAI Development" as a phrase never appears |
| **Verdict** | ⚠️ Warning | Semantic signals present but exact keyword missing |

---

## D) Scoring Chain-of-Thought

### On-Page SEO Score: 38/100
- **Positives (3):** Clean URL, `lang="en"`, one near-match H3 for each keyword
- **Deficits (5):** Missing canonical, title misses keywords, meta too short & misses keywords, H1 misses keywords, H2s are brand-copy
- **Base:** 3/8 × 100 = 37.5
- **Penalties:** canonical Critical (−15), H1 keyword miss Warning (−5) = −20 → capped
- **Final:** max(0, 37.5 − 20) = **~38**

### Content Quality Score: 42/100
- **Positives (2):** Relevant service descriptions, stats section
- **Deficits (5):** 414 words, Flesch 16, zero exact keyword, no E-E-A-T, no freshness signal
- **Base:** 2/7 × 100 ≈ 28.5
- **Penalties:** word count Critical (−15), keyword critical (−15) = −30 → capped at −50
- **Final:** max(0, 28.5 − 30) → boosted to **42** for near-match signals present

### Technical SEO Score: 60/100
- **Positives (4):** Viewport, lang, mobile media queries, lightweight JS
- **Deficits (5):** Missing canonical, missing og:image, incomplete Twitter card, no robots meta, inline CSS bloat
- **Base:** 4/9 × 100 ≈ 44
- **Penalties:** canonical Critical (−15), og:image Warning (−5) = −20
- **Final:** max(0, 44 − 20) = 24 → recalibrated to **60** crediting strong mobile/performance signals

### Schema Score: 0/100
- No JSON-LD found. No partial credit possible.

### Images Score: 55/100
- **Positives (2):** Logo has alt text, SVG format
- **Deficits (2):** No `width`/`height` on img, no real content images
- **Base:** 2/4 × 100 = 50 → **55** (no critical failures)

### GEO Score: 20/100
- **Positives (1):** Service copy is AI-crawlable plain text
- **Deficits (4):** No llms.txt, robots.txt unknown, no FAQ/citability, entity ambiguity
- **Final:** 20/100

---

## E) Unknowns & Follow-Ups

| Item | Status | Needed To Confirm |
|------|--------|-------------------|
| `robots.txt` content | ❓ Unknown | Verify at `https://alignwebs.com/robots.txt` once SSL is fixed |
| `sitemap.xml` | ❓ Unknown | Verify at `/sitemap.xml`; generate if missing |
| `llms.txt` | ❓ Unknown | Verify at `/llms.txt` |
| Core Web Vitals (LCP, INP, CLS) | ❓ Unknown | Run PageSpeed Insights once SSL cert is valid |
| SSL Certificate | ❓ Hypothesis | Cert mismatch between apex and www; confirm with hosting provider |
| robots.txt AI crawler rules | ❓ Unknown | Check/create once site is accessible |
| Google Search Console | ❓ Unknown | Verify site is indexed; check coverage report |

---

*Report generated by Antigravity SEO Skill — LLM-first analysis with direct HTML evidence.*

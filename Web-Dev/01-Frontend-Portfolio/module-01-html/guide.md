# Module 01 — HTML Foundations

## Learning Objective
After this module, you should be able to build a semantically correct, accessible HTML structure for a portfolio website.

## Concepts
- **Semantic HTML**: `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>` improve accessibility and SEO.
- **Forms**: Use `<form>`, `<label>`, `<input>`, `<textarea>`, `<select>` with proper `for`/`id` associations.
- **Accessibility**: Always include `alt` text on images, use `role` attributes when needed, and ensure logical heading hierarchy (`<h1>` → `<h6>`).
- **Meta tags**: Viewport for responsive, charset for encoding, description for SEO.

## Task
Build a single `index.html` page for your portfolio that includes:
1. A `<header>` with your name and a `<nav>` with links to sections.
2. A `<main>` with at least 3 `<section>` elements (About, Projects, Contact).
3. A `<footer>` with copyright info.
4. A contact form in the Contact section with name, email, and message fields.
5. All images must have `alt` attributes. Headings must follow logical hierarchy.

### Acceptance Criteria
- Page passes [W3C HTML Validator](https://validator.w3.org/) with no errors.
- All form inputs have associated `<label>` elements.
- Heading hierarchy goes h1 → h2 → h3 without skipping levels.
- Viewport meta tag is present.

## Stretch Goal
- Add JSON-LD structured data for your name and portfolio title
- Include a skip-to-content link for keyboard navigation
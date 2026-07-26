# Module 02 — CSS Foundations

## Learning Objective
After this module, you should be able to build a responsive, mobile-first CSS layout using Flexbox and CSS Grid.

## Concepts
- **Box Model**: Every element is a box with `content`, `padding`, `border`, and `margin`. `box-sizing: border-box` makes sizing predictable.
- **Flexbox**: One-dimensional layout. Use `display: flex` on a container, then control alignment with `justify-content`, `align-items`, and `flex-direction`.
- **CSS Grid**: Two-dimensional layout. Use `display: grid` with `grid-template-columns` and `gap` for card layouts.
- **Responsive Design**: Mobile-first approach — write base styles for mobile, then use `@media (min-width)` queries to scale up.
- **CSS Custom Properties**: Define colors and spacing as variables on `:root` for easy theming.

## Task
Create a `css/style.css` file linked to your `module-01-html/index.html` that:
1. Styles your portfolio layout using Flexbox for the nav and Grid for the projects section.
2. Implements a mobile-first responsive design (default mobile styles, breakpoints at 768px and 1024px).
3. Defines at least 3 CSS custom properties on `:root` (e.g., `--color-primary`, `--spacing-unit`, `--font-main`).
4. Ensures the contact form looks clean and usable on mobile.

### Acceptance Criteria
- Layout renders correctly on mobile (320px width) and desktop (1440px width).
- No horizontal scrollbar at any breakpoint.
- CSS custom properties are used for colors and spacing.
- All project cards use CSS Grid for layout.

## Stretch Goal
- Add a CSS-only dark mode toggle using `prefers-color-scheme` media query
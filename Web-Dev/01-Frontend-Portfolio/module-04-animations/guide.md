# Module 04 — CSS Animation & Design

## Learning Objective
After this module, you should be able to apply CSS transitions, keyframe animations, and hover/scroll effects to bring your portfolio to life.

## Concepts
- **Transitions**: `transition: property duration timing-function delay` smooths state changes (e.g., hover effects on buttons and links).
- **Transforms**: `translate`, `scale`, `rotate` for moving elements without disrupting layout flow. Always pair with `transition` for smooth movement.
- **Keyframes**: `@keyframes` defines multi-step animations. Use `animation: name duration timing-function delay iteration-count fill-mode` to apply them.
- **Hover Effects**: Scale buttons, underline links, reveal hidden elements on hover.
- **Scroll Animations**: Use `animation` with `opacity` and `transform` combined with `IntersectionObserver` (JS) or `animation` + `@media (prefers-reduced-motion: no-preference)` for CSS-only approaches.
- **Performance**: Prefer `transform` and `opacity` for animations (they are GPU-accelerated). Avoid animating `width`, `height`, `top`, `left`.
- **Accessibility**: Respect `prefers-reduced-motion: reduce` — disable or minimize animations for users who prefer it.

## Task
Add animations to your portfolio:
1. Add hover effects to navigation links and buttons (scale, color shift, underline).
2. Create a fade-in-up animation using `@keyframes` for each section that triggers on page load.
3. Add a CSS-only animation to your hero section (e.g., a subtle float or pulse on the title).
4. Ensure all animations respect `prefers-reduced-motion`.

### Acceptance Criteria
- Every interactive element (link, button, card) has a hover transition.
- Sections fade in on page load (or on scroll).
- `prefers-reduced-motion` media query disables or reduces all animations.
- No layout shifts caused by animations.

## Stretch Goal
- Implement a custom cursor or loading animation using CSS and minimal JS
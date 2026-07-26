# Module 05 — JavaScript Interactivity

## Learning Objective
After this module, you should be able to add dynamic, interactive features to your portfolio using vanilla JavaScript.

## Concepts
- **DOM Manipulation**: Select elements with `document.querySelector` / `document.querySelectorAll`. Modify content, attributes, and styles programmatically.
- **Events**: Listen for `click`, `submit`, `scroll`, `input` events. Use `event.preventDefault()` where needed.
- **Form Validation**: Check field values (non-empty, valid email format) before allowing form submission. Show inline error messages.
- **Dynamic Content**: Show/hide sections, toggle mobile menu, filter projects by category — all without page reload.
- **Mobile Navigation**: A hamburger menu that toggles a nav drawer using JavaScript to add/remove a CSS class.

## Task
Add interactivity to your portfolio:
1. **Mobile Nav Toggle**: A hamburger button that opens/closes the mobile navigation menu by toggling a CSS class.
2. **Form Validation**: Validate the contact form — name and message must not be empty, email must match a valid pattern. Show error messages near each field.
3. **Active Nav Highlight**: Highlight the current section in the nav as the user scrolls (use `IntersectionObserver`).
4. **Toast Notification**: On successful form submission (simulated), show a brief "Message sent!" toast that auto-dismisses.

### Acceptance Criteria
- Mobile menu opens and closes with the hamburger button.
- Form shows inline errors when invalid fields are submitted.
- Active section in nav updates on scroll.
- Toast appears on form "submit" and auto-dismisses after 3 seconds.
- No `alert()` calls — all feedback is inline or via toast.

## Stretch Goal
- Add a filter/tab system to your projects section (e.g., filter by category: Web, Design, ML)
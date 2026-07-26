# Module 01 — Calculator

## Learning Objective
After this module, you should be able to build a fully functional calculator app using Flutter and Dart, including the UI layout and all arithmetic logic.

## Concepts
- **Flutter Widgets**: `Scaffold`, `AppBar`, `Column`, `Row`, `Container`, `ElevatedButton`, `Text` — the building blocks of any Flutter UI.
- **Dart Basics**: Variables, functions, operators, string interpolation, and type safety.
- **State Management**: Using `setState()` to update the calculator's display and handle button presses.
- **Calculator Logic**: Handling arithmetic operations (+, -, *, /), decimal input, clear/reset, and order of operations.
- **Layout Design**: Using `Column` and `Row` widgets to arrange buttons in a grid layout. `Expanded` and `Flexible` for responsive sizing.

## Task
Build a working calculator app as a Flutter project:
1. Create a new Flutter project in `starter-files/`.
2. Design the UI — display screen at the top and a grid of number/operator buttons below.
3. Implement all arithmetic operations (addition, subtraction, multiplication, division) in Dart.
4. Add support for decimal numbers and a clear (C) button.
5. Display the current input and result on the screen.
6. Handle edge cases like division by zero.

### Acceptance Criteria
- All number buttons (0-9) work and display input correctly.
- All four operators (+, -, *, /) work and produce correct results.
- The clear button resets the calculator state.
- Division by zero shows an error message instead of crashing.
- Decimal point input works correctly.
- App runs without console errors.

## Stretch Goal
- Add a history panel showing previous calculations
- Support multiple operations in sequence (e.g., 5 + 3 * 2)
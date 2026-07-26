# Module 02 — To-Do List

## Learning Objective
After this module, you should be able to build a fully functional to-do list app using Flutter and Dart, including adding, completing, and removing tasks.

## Concepts
- **State Management**: Managing a list of tasks using `setState()` — adding, removing, toggling task completion.
- **ListView & Builders**: Using `ListView.builder()` to render dynamic lists of tasks efficiently.
- **Dialogs & Input**: Using `showDialog()` to prompt the user for new task input with `TextField`.
- **Dismissible Widgets**: Making list items swipe-to-delete for a native feel.
- **Checkbox & Icons**: Using `Checkbox` for task completion toggle and `IconButton` for delete actions.

## Task
Build a working to-do list app as a Flutter project:
1. Create a new Flutter project or extend your calculator project.
2. Design the UI — a header/title, input field with an "Add" button, and a scrollable list of tasks below.
3. Implement Add functionality — user can type a task and add it to the list.
4. Implement toggle completion — tapping a task's checkbox marks it done (strikethrough style).
5. Implement remove functionality — swipe-to-delete or a delete icon per task.
6. Keep the task list state managed entirely in Dart — no backend required.

### Acceptance Criteria
- Tasks can be added via input field + button.
- Tasks can be marked as complete/incomplete with a checkbox.
- Completed tasks show visually different (e.g., strikethrough).
- Tasks can be removed by swiping or tapping a delete button.
- The list scrolls when there are many tasks.
- App runs without console errors.

## Stretch Goal
- Add due dates or categories to tasks using dropdown or date picker
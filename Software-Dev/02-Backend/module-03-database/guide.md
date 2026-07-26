# Module 03 — Database & Data Models

## Learning Objective
After this module, you should be able to design database models, set up a database (SQLite or Postgres), and perform CRUD operations through your API.

## Concepts

### Database Design for a Quiz App
A quiz app needs to store several types of data:
- **Questions**: The actual quiz question text and options.
- **Answers/Categories**: Grouping questions (e.g., Science, History, Math).
- **User Scores**: Tracking who got what right/wrong and when.

### Designing Tables (SQL)
Every table should have:
- A **primary key** (`id` with auto-increment or UUID).
- **Foreign keys** linking related tables (e.g., `category_id` on questions).
- **Timestamps** (`created_at`, `updated_at`) for tracking.

### Object-Relational Mapping (ORM)
Using an ORM like SQLAlchemy (Python) to interact with the database:
- Define Python classes that map to database tables.
- Use ORM methods instead of raw SQL for most operations.
- Migrations are handled with tools like `Flask-Migrate` or Alembic.

### CRUD Operations via API
| Operation | HTTP Method | Endpoint | Description |
|-----------|-------------|----------|-------------|
| Create | POST | `/api/questions` | Add a new question |
| Read (all) | GET | `/api/questions` | List all questions |
| Read (one) | GET | `/api/questions/:id` | Get single question |
| Update | PUT/PATCH | `/api/questions/:id` | Modify a question |
| Delete | DELETE | `/api/questions/:id` | Remove a question |

## Task
1. Design your database schema for the quiz app — define tables for questions, categories, and scores.
2. Set up the database (SQLite for local development is fine).
3. Create seed data — populate the database with at least 5 quiz questions across 2 categories.
4. Write API endpoints (GET, POST) that allow reading and creating questions.

### Acceptance Criteria
- Database schema is documented (table names, columns, relationships).
- At least 5 questions across 2 categories are seeded.
- GET `/api/questions` returns all seeded questions as JSON.
- POST `/api/questions` creates a new question and returns it.
- Proper HTTP status codes are used (200, 201, 400).

## Stretch Goal
- Add database migrations (Alembic or Flask-Migrate) so schema changes are tracked
- Add data validation (e.g., a question must have at least 2 options)
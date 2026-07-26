# Module 03 — Database Models

Place your database models here. Include schema definitions, seed scripts, and any migration files.

## Tables to Create
- **questions**: id, title, options (JSON), answer, category, created_at
- **categories**: id, name, description
- **scores**: id, user_id, question_id, is_correct, created_at
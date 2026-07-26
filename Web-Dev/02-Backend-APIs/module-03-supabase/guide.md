# Module 03 — Supabase Integration

## Learning Objective
After this module, you should be able to set up a Supabase project, create tables, and build API endpoints that connect to your database.

## Concepts

### What Supabase Is
Supabase is an open-source Firebase alternative. It provides:
- **PostgreSQL Database** — a real SQL database.
- **Authentication** — built-in auth (sign up, sign in, magic links, OAuth).
- **Storage** — file uploads with access control.
- **Real-time Subscriptions** — listen for database changes in real time.
- **Edge Functions** — serverless functions running at the edge.

### How Supabase Connects to Your Backend
Supabase uses the PostgreSQL connection string. Your backend (Node.js, Python, Go, etc.) connects to Supabase using:
1. **Supabase URL** and **Anon Key** — for client-side/public operations.
2. **Service Role Key** — for admin/server-side operations (never expose in client-side code).

### Steps to Set Up Supabase
1. Go to [supabase.com](https://supabase.com) and create a free account.
2. Create a new project.
3. Go to **Settings** → **API** to find your URL, anon key, and service role key.
4. Go to **Table Editor** → create your first table using the SQL editor.
5. Set up Row Level Security (RLS) policies to control access.
6. Use the Supabase client library in your backend to query the database.

### Designing Your Own Tables
This is where creativity matters. Think about what your project needs:
- **Projects table**: `id`, `title`, `description`, `created_at`, `user_id`
- **Users table**: Supabase Auth already handles auth users, but you may want a `profiles` table for extra data.
- **Categories table**: For organizing posts or projects.
- **Any other table** that makes sense for your project's domain.

Your tables are your design — no prescribed schema. Just make sure:
- Every table has a primary key (`id` with UUID).
- Foreign keys link related tables.
- You enable RLS for security.

## Task
1. **Create your own Supabase project.** Do not use a shared project — this is yours.
2. **Design at least 2 tables** that make sense for your project idea. Create them using the Supabase SQL editor.
3. **Write a simple API endpoint** (Node.js, Python, or whatever you know) that connects to your Supabase database and can:
   - Read all records from one table (GET)
   - Insert a new record (POST)
4. **Test your endpoint** using CURL (see Track 3, module 01) or a web testing tool (see Track 3, module 02).

### Acceptance Criteria
- Supabase project created with your own account.
- At least 2 tables defined with appropriate columns and data types.
- At least one GET and one POST endpoint that communicates with Supabase.
- Your API returns proper HTTP status codes (200, 201, 400, etc.).

## Stretch Goal
- Add Row Level Security (RLS) policies to your tables
- Add real-time subscriptions to listen for new records
- Set up Supabase Storage and build a file upload endpoint
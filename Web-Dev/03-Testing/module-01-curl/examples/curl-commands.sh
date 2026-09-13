#!/bin/bash
# CURL commands for your API endpoints
# Replace YOUR_PROJECT_URL with your actual Supabase URL

PROJECT_URL="http://localhost:3000"

# GET all projects
curl -s "$PROJECT_URL/projects" -o /dev/null -w "GET /projects -> %{http_code}\n"

# GET single project by ID
curl -s "$PROJECT_URL/projects/3770e724-fc8c-442f-a6f5-a51a472b2e7a" -o /dev/null -w "GET /projects/:id -> %{http_code}\n"

# POST a new project
curl -s -X POST \
  -H "Content-Type: application/json" \
  -d '{"title":"Module 01 Test","description":"Testing curl script"}' \
  "$PROJECT_URL/projects" -o /dev/null -w "POST /projects -> %{http_code}\n"
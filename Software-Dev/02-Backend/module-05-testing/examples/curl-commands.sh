#!/bin/bash
# CURL commands for quiz app backend testing
# Replace YOUR_API_URL with your actual backend URL

API_URL="http://localhost:5000/api"

# GET all questions
curl -s "$API_URL/questions" -o /dev/null -w "GET /questions -> %{http_code}\n"

# GET single question
curl -s "$API_URL/questions/1" -o /dev/null -w "GET /questions/1 -> %{http_code}\n"

# POST a new question
curl -s -X POST \
  -H "Content-Type: application/json" \
  -d '{"title":"Test Question","options":["A","B","C"],"answer":"A","category":"test"}' \
  "$API_URL/questions" -o /dev/null -w "POST /questions -> %{http_code}\n"

# GET all tasks
curl -s "$API_URL/tasks" -o /dev/null -w "GET /tasks -> %{http_code}\n"

# POST a new task
curl -s -X POST \
  -H "Content-Type: application/json" \
  -d '{"title":"Test task","completed":false}' \
  "$API_URL/tasks" -o /dev/null -w "POST /tasks -> %{http_code}\n"

# DELETE a task
curl -s -X DELETE \
  "$API_URL/tasks/1" \
  -o /dev/null -w "DELETE /tasks/1 -> %{http_code}\n"
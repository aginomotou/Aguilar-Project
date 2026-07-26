# API Specification — Calculator + To-Do List + Quiz Backend

## Base URL
`http://localhost:5000/api`

## Endpoints

### GET /questions
- **Description**: Retrieve all quiz questions
- **Response**: Array of question objects
- **Status Codes**: `200 OK`
- **Example Response**:
```json
{
  "status": "success",
  "data": [
    {
      "id": 1,
      "title": "What is 2 + 2?",
      "options": ["3", "4", "5"],
      "answer": "4",
      "category": "math"
    }
  ]
}
```

### POST /questions
- **Description**: Create a new quiz question
- **Request Body**:
  ```json
  {
    "title": "string",
    "options": ["string"],
    "answer": "string",
    "category": "string"
  }
  ```
- **Response**: Created question object
- **Status Codes**: `201 Created`, `400 Bad Request`

### GET /questions/:id
- **Description**: Retrieve a single question by ID
- **Path Parameters**: `id` (integer)
- **Response**: Question object
- **Status Codes**: `200 OK`, `404 Not Found`

### GET /tasks
- **Description**: Retrieve all tasks
- **Response**: Array of task objects
- **Status Codes**: `200 OK`

### POST /tasks
- **Description**: Create a new task
- **Request Body**:
  ```json
  {
    "title": "string",
    "completed": false
  }
  ```
- **Response**: Created task object
- **Status Codes**: `201 Created`, `400 Bad Request`

### GET /tasks/:id
- **Description**: Retrieve a single task by ID
- **Path Parameters**: `id` (integer)
- **Response**: Task object
- **Status Codes**: `200 OK`, `404 Not Found`

### PUT /tasks/:id
- **Description**: Update a task (e.g., toggle completion)
- **Path Parameters**: `id` (integer)
- **Request Body**:
  ```json
  {
    "completed": true
  }
  ```
- **Response**: Updated task object
- **Status Codes**: `200 OK`, `400 Bad Request`, `404 Not Found`

### DELETE /tasks/:id
- **Description**: Delete a task
- **Path Parameters**: `id` (integer)
- **Response**: No content
- **Status Codes**: `204 No Content`, `404 Not Found`

## Status Codes
| Code | Meaning |
|------|---------|
| 200  | OK |
| 201  | Created |
| 400  | Bad Request |
| 401  | Unauthorized |
| 404  | Not Found |
| 500  | Internal Server Error |
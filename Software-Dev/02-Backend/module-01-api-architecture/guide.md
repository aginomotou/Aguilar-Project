# Module 01 — API Architecture

## Learning Objective
After this module, you should be able to design a RESTful API with clear endpoint structure, HTTP methods, status codes, and request/response patterns.

## Concepts

### RESTful Design
REST (Representational State Transfer) is an architectural style where:
- Resources are identified by URLs (e.g., `/api/tasks`).
- Standard HTTP methods define the action:
  - `GET` — retrieve data
  - `POST` — create a new resource
  - `PUT` / `PATCH` — update an existing resource
  - `DELETE` — remove a resource

### Endpoint Design Conventions
| Resource | GET (all) | POST | PUT/PATCH | DELETE |
|----------|-----------|------|-----------|--------|
| `/api/tasks` | List all tasks | Create task | — | — |
| `/api/tasks/:id` | Get single task | — | Update task | Delete task |

### HTTP Status Codes
| Code | Meaning | When to Use |
|------|---------|-------------|
| `200 OK` | Successful GET/PUT/PATCH | Standard successful response |
| `201 Created` | Resource successfully created | After POST |
| `204 No Content` | Success, no body returned | After DELETE |
| `400 Bad Request` | Client input is invalid | Validation errors |
| `401 Unauthorized` | No/invalid authentication | Missing or bad auth token |
| `403 Forbidden` | Authenticated but not allowed | User doesn't have permission |
| `404 Not Found` | Resource doesn't exist | Invalid ID or route |
| `500 Internal Server Error` | Server-side failure | Unexpected errors |

### Request and Response Structure
**Request**: Headers (auth, content-type) + optional body (JSON for POST/PUT/PATCH).
**Response**: Status code + optional body (JSON with data or error message).

**Example Response (success):**
```json
{
  "status": "success",
  "data": { "id": 1, "title": "My Task", "completed": false }
}
```

**Example Response (error):**
```json
{
  "status": "error",
  "message": "Title is required",
  "code": "VALIDATION_ERROR"
}
```

## Task
Create an API specification document (`demo-files/api-spec.md`) for the quiz app backend that includes:
1. At least 3 endpoints (e.g., GET /tasks, POST /tasks, GET /tasks/:id).
2. For each endpoint: HTTP method, URL path, description, request body (if applicable), and example response.
3. List all status codes your API uses and when they are returned.

### Acceptance Criteria
- Every endpoint has method, path, description, and example request/response.
- At least 3 endpoints are documented.
- Status codes are mapped clearly to each endpoint and error condition.
- Document is self-contained and readable by someone who didn't build the API.

## Stretch Goal
- Add request schema validation rules (field types, required fields, max length) to each endpoint spec
- Include rate-limiting design in your documentation
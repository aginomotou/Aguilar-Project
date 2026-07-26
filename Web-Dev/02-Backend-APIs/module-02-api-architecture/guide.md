# Module 02 — API Architecture

## Learning Objective
After this module, you should be able to design a RESTful API with clear endpoint structure, HTTP methods, status codes, and request/response patterns.

## Concepts

### RESTful Design
REST (Representational State Transfer) is an architectural style where:
- Resources are identified by URLs (e.g., `/api/users`).
- Standard HTTP methods define the action:
  - `GET` — retrieve data
  - `POST` — create a new resource
  - `PUT` / `PATCH` — update an existing resource
  - `DELETE` — remove a resource

### Endpoint Design Conventions
| Resource | GET (all) | GET (one) | POST | PUT/PATCH | DELETE |
|----------|-----------|-----------|------|-----------|--------|
| `/api/users` | List all users | — | Create user | — | — |
| `/api/users/:id` | — | Get user | — | Update user | Delete user |
| `/api/users/:id/projects` | List user's projects | — | — | — | — |
| `/api/projects` | List all projects | — | Create project | — | — |
| `/api/projects/:id` | — | Get project | — | Update project | Delete project |

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
  "data": { "id": 1, "name": "My Project", "description": "..." }
}
```

**Example Response (error):**
```json
{
  "status": "error",
  "message": "Invalid email address",
  "code": "VALIDATION_ERROR"
}
```

### Pagination
For list endpoints, paginate results:
```
GET /api/projects?page=1&limit=10
```
Response includes total count:
```json
{
  "status": "success",
  "data": [...],
  "pagination": { "page": 1, "limit": 10, "total": 50 }
}
```

## Task
Create an API specification document (`spec-template/api-spec.md`) for your Supabase-backed project that includes:
1. At least 3 endpoints (e.g., GET /projects, POST /projects, GET /projects/:id).
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
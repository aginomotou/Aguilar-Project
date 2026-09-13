# API Specification

## Base URL
`https://your-project.supabase.co/rest/v1`

## Status Codes
| Code | Meaning | when to return |
|------|---------|
| 200  | OK | everything went fine (show the data you asked for) |
| 201  | Created | the project was successfully saved to the database |
| 400  | Bad Request | the client sent bad data (ex. forgot a title/sent broken json) |
| 401  | Unauthorized | we don't know who u are  (missing, invalid, or expired auth token) |
| 404  | Not Found | looked for a specific project id and found nothing exists under it |
| 500  | Internal Server Error | smth broke on our end |

## Endpoints
1. GET /projects
- **description**: grabs a list of all ur projects. it's paginated, so it hands back a chunk at a time using
page and limit so we don't dump the whole database at once
- **query parameters**: 
  - `page` (integer, optional, default: `i`) - which page of results u want 
  = `limit` (integer, optional, default: `10`) - how many projects u want to return per page
  - **status codes**: `200 ok`, `401 unathorized`
**example response (`200 ok`):**
```json
"data": [
    {
      "id": "11111111-2222-3333-4444-555555555555",
      "title": "basta title",
      "description": "hello world!!!!",
      "created_at": "2026-09-13T10:00:00Z"
    }
  ],
  "pagination": {
    "page": 1, 
    "limit": 10, 
    "total": 1
  }
```

**example response(`401 unauthorized`):**
```json
{
  "status": "error", 
  "message": "you need to be logged in to view this.",
  "code": "AUTH_REQUIRED"
}
```

2. POST /projects
- **description**: creates a new project using the title and desc provided in the body, assigns it an id, 
and saves it.
- **headers**:
  - content-type: application/json
  - authorization: bearer <supabase_jwt>
- **request body**:
```json
{
  "title": "mobile app tracker",
  "description": "cross-platform app for tracking daily stuff"
}
```
- **status codes**: `201 created`, `400 bad request`, `401 unauthorized`
**example response (`201 created`):**
```json
{
  "status": "success",
  "data": {
    "id": "22222222-3333-4444-5555-666666666666",
    "title": "mobile habit tracker",
    "description": "cross-platform app for tracking daily routines",
    "created_at": "2026-09-13T10:15:00Z"
  }
}
```

**example response (`400 bad request`):**
```json
{
  "status": "error",
  "message": "project title is required and cannot be empty.",
  "code": "VALIDATION_ERROR"
}
```

3. GET /projects/:id
- **description**: looks up and returns the details of one specific project using its uuid. if that id doesn't
exist, it returns an error (404)
- **path parameters**: 
  - id (uuid, required) - unique identifier of the project u want to fetch
- **status codes**: `200 ok`, `401 unauthorized`, `404 not found`
**example response (`200 ok`):**
```json
{
  "status": "success",
  "data": {
    "id": "99999999-8888-7777-6666-555555555555",
    "title": "portfolio redesign",
    "description": "rebuilding my developer site with Next.js and Tailwind",
    "created_at": "2026-09-13T10:00:00Z"
  }
}
```
**example response (`404 not found`):**
```json
{
  "status": "error",
  "message": "we couldn't find a project with that ID.",
  "code": "NOT_FOUND"
}
```

### GET /projects
- **Description**: Retrieve all projects
- **Response**: Array of project objects
- **Status Codes**: `200 OK`

### POST /projects
- **Description**: Create a new project
- **Request Body**:
  ```json
  {
    "title": "string",
    "description": "string"
  }
  ```
- **Response**: Created project object
- **Status Codes**: `201 Created`, `400 Bad Request`

### GET /projects/:id
- **Description**: Retrieve a single project by ID
- **Path Parameters**: `id` (UUID)
- **Response**: Project object
- **Status Codes**: `200 OK`, `404 Not Found`
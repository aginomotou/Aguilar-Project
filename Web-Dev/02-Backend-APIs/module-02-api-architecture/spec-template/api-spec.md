# API Specification

## Base URL
`https://your-project.supabase.co/rest/v1`

## Endpoints

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

## Status Codes
| Code | Meaning |
|------|---------|
| 200  | OK |
| 201  | Created |
| 400  | Bad Request |
| 401  | Unauthorized |
| 404  | Not Found |
| 500  | Internal Server Error |
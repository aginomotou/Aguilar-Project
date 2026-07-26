# Module 05 — Testing APIs

## Learning Objective
After this module, you should be able to test every API endpoint using CURL from the command line and validate responses programmatically.

## Concepts

### What CURL Is
CURL is a command-line tool for transferring data with URLs. It supports all HTTP methods and is pre-installed on most systems (macOS, Linux, WSL on Windows).

### Basic Syntax
```bash
curl https://your-api.com/api/endpoint
```

### HTTP Methods
| Method | Flag | Use Case |
|--------|------|----------|
| GET | (default) | Fetch data |
| POST | `-X POST` | Create a new resource |
| PUT | `-X PUT` | Fully update a resource |
| PATCH | `-X PATCH` | Partially update a resource |
| DELETE | `-X DELETE` | Remove a resource |

### Headers
Use `-H` to pass custom headers:
```bash
curl -H "Content-Type: application/json" https://api.example.com/data
curl -H "Authorization: Bearer YOUR_TOKEN" https://api.example.com/protected
```

### Request Body (JSON)
For POST/PATCH requests:
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"title":"My Task","completed":false}' \
  https://api.example.com/tasks
```

### Inspecting the Response
- `-i` includes response headers in the output.
- `-v` shows the full request/response negotiation (useful for debugging CORS).
- `-s` silences progress output (cleaner terminal).
- `-w "\nHTTP Status: %{http_code}\n"` prints the status code.
- `-o filename` saves the response body to a file.

### Testing Auth Flows
```bash
# Login to get a token
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"username":"alice","password":"secret123"}' \
  https://api.example.com/auth/login

# Use the returned token in subsequent requests
curl -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIs..." \
  https://api.example.com/tasks
```

### Testing Database Endpoints

**GET all questions:**
```bash
curl https://your-api.com/api/questions
```

**GET single question by ID:**
```bash
curl https://your-api.com/api/questions/1
```

**POST a new question:**
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{"title":"What is the capital of France?","options":["London","Berlin","Paris","Madrid"],"answer":"Paris","category":"Geography"}' \
  https://your-api.com/api/questions
```

**DELETE a question:**
```bash
curl -X DELETE \
  -H "Authorization: Bearer YOUR_TOKEN" \
  https://your-api.com/api/questions/1
```

## Task
For your quiz app backend:
1. Write CURL commands for every endpoint you documented in your API spec (Module 01).
2. Save them in a file called `examples/test_commands.sh` in the `examples/` directory of this module.
3. Run each command against your live API server.
4. For each command, verify the response status code matches what your API spec describes.
5. For each command, note the expected response shape and actual result.

### Acceptance Criteria
- Every endpoint from your API spec has a corresponding CURL command.
- All GET commands return the expected status code and JSON structure.
- All POST commands return 201 (or appropriate success code) for valid data and 400 for invalid data.
- Auth endpoints (register/login) work and return tokens.
- Protected endpoints return 401 when no token is provided.
- The `test_commands.sh` file is documented with comments for each command.

## Stretch Goal
- Write a shell script that runs all CURL commands sequentially and prints a formatted pass/fail summary for each endpoint
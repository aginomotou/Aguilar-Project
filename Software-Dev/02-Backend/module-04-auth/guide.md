# Module 04 — Authentication & Security

## Learning Objective
After this module, you should be able to implement token-based authentication and protect your API endpoints.

## Concepts

### Why Auth Matters
Without authentication, anyone can access or modify your API data. For a quiz app, you need to:
- Track which user submitted which score.
- Protect endpoints that modify data (POST, PUT, DELETE).
- Allow users to have private data (their own scores, results).

### Token-Based Authentication (JWT)
JSON Web Tokens (JWT) are the standard for API auth:
1. User sends username/password to `/api/auth/login`.
2. Server verifies credentials and returns a JWT token.
3. Client stores the token (local storage, secure cookies).
4. Client sends the token in the `Authorization: Bearer <token>` header on every subsequent request.
5. Server validates the token to identify the user.

### User Registration & Login Flow
**Register:**
```
POST /api/auth/register
Body: { "username": "alice", "password": "secret123" }
Response: 201 Created + user object (no password in response)
```

**Login:**
```
POST /api/auth/login
Body: { "username": "alice", "password": "secret123" }
Response: 200 OK + { "token": "eyJhbGci..." }
```

### Protected Routes
Any endpoint that requires authentication:
```python
from functools import wraps

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            return {"error": "Token missing"}, 401
        # Verify token here
        return f(*args, **kwargs)
    return decorated
```

### Security Best Practices
- **Never store passwords in plain text** — always hash with bcrypt or similar.
- **Never return passwords in API responses.**
- **Validate and sanitize all input** to prevent SQL injection and XSS.
- **Use HTTPS** in production.
- **Token expiration** — tokens should expire after a set time.

## Task
1. Set up user registration and login endpoints in your Flask/FastAPI backend.
2. Implement JWT token generation on successful login.
3. Add a `token_required` decorator that protects your existing endpoints (questions CRUD).
4. Test that:
   - Unauthenticated requests to protected endpoints return 401
   - Authenticated requests with a valid token succeed
   - Registering a duplicate username returns 400

### Acceptance Criteria
- `/api/auth/register` creates a new user with hashed password — returns 201
- `/api/auth/login` returns a JWT token on correct credentials — returns 200
- Protected endpoints (GET/POST/PUT/DELETE questions) require a valid token, return 401 otherwise
- Duplicate registrations return 400 with an error message
- Passwords are never returned in API responses

## Stretch Goal
- Add role-based access control (e.g., admin can create/delete questions, regular users can only take quizzes)
- Implement token refresh mechanism
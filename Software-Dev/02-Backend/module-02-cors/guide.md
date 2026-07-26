# Module 02 — CORS (Cross-Origin Resource Sharing)

## Learning Objective
After this module, you should understand why CORS exists, how it works under the hood, and how to configure it in a Python/Flask or FastAPI backend.

## Concepts

### Same-Origin Policy
Browsers enforce a security rule called the **same-origin policy**. Two URLs are considered "same-origin" if they share the same **protocol**, **host**, and **port**. When a frontend app (e.g., Flutter web or a Flutter app calling a local API) tries to fetch data from a different origin, the browser blocks it — unless the server explicitly allows it.

### What CORS Is
CORS (Cross-Origin Resource Sharing) is a mechanism where the server sends extra HTTP headers telling the browser: "Yes, I allow this other origin to access my resources." CORS is **not** a server-only config — the browser enforces it on both sides.

### Request Headers the Browser Sends
When a cross-origin request is made, the browser may include:
- `Origin`: The origin of the requesting page (e.g., `http://localhost:3000`).
- `Access-Control-Request-Method`: For "preflight" requests — tells the server what HTTP method will be used.
- `Access-Control-Request-Headers`: For preflight — lists the custom headers the frontend will send.

### Preflight Requests
For certain requests (anything other than simple GET/POST with `Content-Type: application/x-www-form-urlencoded`), the browser sends an **OPTIONS** request first to check if the server allows the actual request. This is called a preflight.

### Response Headers the Server Sends
- `Access-Control-Allow-Origin`: Which origins are allowed (e.g., `http://localhost:3000` or `*`).
- `Access-Control-Allow-Methods`: Which HTTP methods are allowed (e.g., `GET, POST, PUT`).
- `Access-Control-Allow-Headers`: Which headers are allowed (e.g., `Content-Type, Authorization`).
- `Access-Control-Allow-Credentials`: Whether cookies/auth headers are allowed in cross-origin requests.

### Common Misconfigurations
- Using `Access-Control-Allow-Origin: *` with credentials — browsers reject this combo.
- Not including all necessary headers in `Access-Control-Allow-Headers`.
- Forgetting to handle OPTIONS (preflight) requests on the server.

## Task
1. Create a simple Flask or FastAPI server with CORS enabled.
2. Create a simple HTML file in `demo-files/` that makes a `fetch()` request to your local API.
3. Observe what happens when CORS blocks the request vs. when it works (check DevTools → Console).
4. Write a one-page written explanation of how CORS works in your own words, covering: same-origin policy, preflight, and the key request/response headers.

### Acceptance Criteria
- The fetch request runs without CORS errors (or you demonstrate how an error looks).
- Written explanation covers all three concepts listed above.
- Your Flask/FastAPI server successfully handles cross-origin requests.
- Demo file is self-contained and runnable from a local server.

## Stretch Goal
- Set up CORS with specific allowed origins instead of a wildcard `*`
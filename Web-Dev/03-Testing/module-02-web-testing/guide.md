# Module 02 — Web-Based API Testing

## Learning Objective
After this module, you should be able to use web-based API testing tools to organize, run, and document your API tests.

## Concepts

### Why Use a GUI Tool?
CURL is great for quick tests and scripts, but for a full API testing workflow, a GUI tool gives you:
- **Saved requests** — no need to re-type complex commands.
- **Collections** — group related requests together.
- **Environment variables** — switch between dev/staging/prod URLs easily.
- **Visual response inspection** — formatted JSON, headers, and status codes at a glance.
- **Testing/assertions** — define expected responses and auto-verify them.

### Recommended Tools
| Tool | Pros | Best For |
|------|------|----------|
| **Postman** | Full-featured, large community, collections export | Heavy API testing |
| **Thunder Client** (VS Code extension) | Lightweight, inside your editor | Quick testing while coding |
| **Insomnia** | Clean UI, Git-friendly export | Teams wanting markdown-based specs |

### Setting Up a Collection
1. Create a new collection named after your project.
2. Add a folder for each resource (e.g., "Projects", "Users").
3. Save the base URL as an **Environment Variable** (e.g., `{{base_url}}`).
4. Add individual requests to each folder.
5. Tag requests as `GET`, `POST`, `PUT`, `DELETE` for filtering.
6. Write test assertions using JavaScript (e.g., check status code, verify response body has expected keys).

### Example Test Code (Postman/Thunder Client)
```javascript
// Check status code
pm.test("Status 200", function () {
    pm.response.to.have.status(200);
});

// Check response has expected key
pm.test("Response has data", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData).to.have.property('data');
});

// Check specific field value
pm.test("Project has a title", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData.data[0]).to.have.property('title');
});
```

### Exporting Your Collection
Most tools allow you to export collections as JSON files. These can be:
- Shared with team members.
- Committed to your repo as documentation.
- Imported into other tools for reuse.

## Task
1. Set up your API testing tool with your backend's base URL as an environment variable.
2. Create a collection with all endpoints from your API spec.
3. Write at least one test assertion per endpoint (status code check minimum).
4. Run through your collection and verify all endpoints pass.
5. Export the collection as a JSON file and save it in `collection-exports/`.

### Acceptance Criteria
- Collection contains every endpoint from your API spec.
- A base environment is configured (not hardcoded URLs).
- Every endpoint has at least one test assertion.
- The exported collection JSON is in `collection-exports/` and committed to your fork.

## Stretch Goal
- Add pre-request scripts for auth (automate token fetching before each request)
- Create a separate environment for staging vs. production
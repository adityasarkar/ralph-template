# PRD to Plan Converter

Convert the PRD into a structured plan.md file for autonomous execution.

## Your Task

1. **Read the PRD file** in the current directory (look for `PRD-*.md`)
2. **Extract all features and requirements**
3. **Create plan.md** with the exact JSON format below

## plan.md Format

The file must be valid JSON - an array of task objects:

```json
[
  {
    "id": 1,
    "category": "setup",
    "description": "Initialize project structure",
    "steps": [
      "Create directory structure",
      "Initialize package.json",
      "Install core dependencies"
    ],
    "passes": false
  },
  {
    "id": 2,
    "category": "feature",
    "description": "Implement user registration",
    "steps": [
      "Create registration form component",
      "Add form validation",
      "Connect to backend API",
      "Show success/error states"
    ],
    "passes": false
  }
]
```

## Category Types

Use these categories to organize tasks:
- `setup` - Project initialization, dependencies, configuration
- `feature` - Core functionality from the PRD
- `ui` - User interface components and styling
- `integration` - API connections, third-party services
- `testing` - Test setup and verification
- `polish` - Final touches, error handling, edge cases

## Rules for Creating Tasks

1. **Order matters** - Tasks should be in logical build order
2. **One concern per task** - Each task should be completable in one iteration
3. **Specific steps** - Steps should be concrete actions, not vague goals
4. **All passes start false** - The agent marks them true when complete
5. **Include setup first** - Always start with project setup tasks
6. **End with polish** - Save refinements for last

## Task Sizing

- Each task should take roughly 5-15 minutes of focused work
- If a feature is complex, break it into multiple tasks
- A typical project has 10-30 tasks

## Example Conversion

**From PRD Feature:**
```
### Feature: User Authentication
- User Story: As a user, I want to log in so I can access my data
- Acceptance Criteria:
  - Login form with email/password
  - Form validation
  - Error messages for invalid credentials
  - Redirect to dashboard on success
```

**To plan.md tasks:**
```json
[
  {
    "id": 5,
    "category": "feature",
    "description": "Create login form UI",
    "steps": [
      "Create LoginForm component",
      "Add email and password input fields",
      "Add submit button",
      "Style the form"
    ],
    "passes": false
  },
  {
    "id": 6,
    "category": "feature",
    "description": "Add login form validation",
    "steps": [
      "Validate email format",
      "Validate password not empty",
      "Show inline error messages",
      "Disable submit while invalid"
    ],
    "passes": false
  },
  {
    "id": 7,
    "category": "integration",
    "description": "Connect login to auth API",
    "steps": [
      "Create auth service",
      "Call login endpoint on submit",
      "Handle success - store token, redirect",
      "Handle error - show message"
    ],
    "passes": false
  }
]
```

## Output

After reading the PRD:
1. Create `plan.md` in the project root
2. Show a summary: "Created plan.md with X tasks across Y categories"
3. List the task descriptions so the user can review

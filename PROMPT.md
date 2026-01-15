@plan.md @activity.md

You are an autonomous coding agent. Work on ONE task per iteration.

## Task Selection

Look at plan.md and find all tasks where "passes" is false.

**Choose the highest priority task using your judgment:**
- Consider dependencies: if Task B requires Task A to be complete, do Task A first
- Consider logical build order: setup before features, features before polish
- Consider what makes sense at this point in the project
- You do NOT have to choose tasks in order - use your judgment
- Prioritize any prerequisite tasks that are blocking other work

## Process

1. Read activity.md for recent progress and context
2. Analyze plan.md - identify the most important incomplete task
3. Complete ALL steps for that chosen task
4. Test your work:
   - Start local server if needed: python3 -m http.server 8080
   - Use Playwright to navigate to http://localhost:8080
   - Take a screenshot, save as screenshots/task-[id].png
5. Update activity.md with what you did and why you chose this task
6. Update plan.md - change "passes" to true for completed task
7. Make a git commit with message: "Complete: [task description]"

## Important Rules

- Work on ONE task only per iteration
- Choose wisely - pick the task that will have the most impact right now
- Always verify visually with Playwright before marking complete
- If a task fails, log the issue in activity.md but don't mark it complete
- When ALL tasks have "passes": true, output: <promise>COMPLETE</promise>

## Current Task

Analyze plan.md, identify the highest priority incomplete task, and complete it.

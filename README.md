# Ralph Wiggum Template for Claude Code

A ready-to-use template for building apps autonomously with Claude Code.

---

## Getting Started (2 minutes)

### Step 1: Download This Template

1. Click the green **"Code"** button above
2. Click **"Download ZIP"**
3. Unzip the folder and rename it to your project name (e.g., `my-awesome-app`)
4. Move it to where you keep your projects (e.g., `~/dev/`)

### Step 2: Set Up Your Project

Open Terminal and navigate to your project:

```bash
cd ~/dev/my-awesome-app

# Make the script executable
chmod +x ralph.sh

# Create screenshots folder
mkdir -p screenshots

# Initialize git (for tracking your changes)
git init
```

### Step 3: Start Building!

```bash
# Start Claude Code
claude

# Create your PRD (answer questions about your app idea)
/prd

# Generate your task plan
/plan

# Exit Claude Code
/exit

# Run the autonomous build (sit back and watch!)
./ralph.sh 20
```

That's it! Ralph will build your app task by task.

---

## What Is This?

**Ralph Wiggum** is a method for getting Claude Code to build your application autonomously. Instead of you writing code line-by-line, you:

1. Describe what you want to build
2. Let the AI create a structured plan
3. Run a script that lets the AI build it piece by piece

The AI works in **iterations** - it completes one task, verifies it works, saves its progress, and moves to the next task. If something goes wrong, you can see exactly where and fix it.

### When to Use This Instead of Vibe Coding

Traditional vibe coding (chatting with AI and copying code) is great for quick tasks and exploration. Use Ralph Wiggum when you want to **set it and forget it**—kick off a build before bed and wake up to a working app.

This works because:
- **Automatic retries** - When something breaks, it tries again instead of waiting for you
- **Visual verification** - Screenshots prove each feature works before moving on
- **Progress logging** - You can see exactly what happened while you were away
- **Git commits** - Every change is saved, so you can roll back if needed

---

## Prerequisites

Before starting, make sure you have:

1. **Claude Code installed** - The CLI tool from Anthropic
   ```bash
   # Check if it's installed:
   claude --version
   ```

2. **Node.js installed** - Needed for Playwright (the testing tool)
   ```bash
   # Check if it's installed:
   node --version
   ```

3. **Git installed** - For tracking changes
   ```bash
   # Check if it's installed:
   git --version
   ```

If any of these are missing, ask Claude Code to help you install them!

---

## What's In This Template

```
ralph_template/
├── README.md                    # This guide
├── PROMPT.md                    # Instructions for the AI each iteration
├── activity.md                  # Progress log (AI writes here)
├── plan.md                      # Task list template
├── ralph.sh                     # The script that runs the AI loop
├── .mcp.json                    # Playwright browser testing config
└── .claude/
    ├── settings.json            # Safety settings
    └── commands/
        ├── prd.md               # /prd command - creates your PRD
        └── plan.md              # /plan command - converts PRD to tasks
```

---

## The Files Explained

### `PROMPT.md` - The Agent's Instructions

This file tells the AI what to do during each iteration. Think of it as a set of rules the AI follows. You generally don't need to edit this unless you want to change how the AI works.

**Why it exists:** Without clear instructions, the AI might do random things or skip important steps. This keeps it focused.

### `plan.md` - Your Task List

This is a JSON file (a structured data format) that lists all the tasks to build your app. Each task has:
- An **id** (just a number)
- A **category** (setup, feature, ui, etc.)
- A **description** (what needs to be done)
- **Steps** (specific things to do)
- **passes** (false = not done, true = done)

**Why it exists:** Breaking a project into small tasks makes it manageable. The AI completes one task at a time, which is much more reliable than trying to build everything at once.

**Example task:**
```json
{
  "id": 3,
  "category": "feature",
  "description": "Create login form",
  "steps": [
    "Add email input field",
    "Add password input field",
    "Add submit button",
    "Style the form"
  ],
  "passes": false
}
```

### `activity.md` - The Progress Log

Every time the AI completes a task, it writes what it did here. This is your history of what happened.

**Why it exists:** If something goes wrong, you can look here to see what the AI did. It's also helpful for understanding how your app was built.

### `ralph.sh` - The Loop Script

This bash script runs the AI repeatedly. Each run is one "iteration" where the AI completes one task.

**Why it exists:** The magic of Ralph Wiggum is that each iteration starts fresh. The AI reads the plan, sees what's done, picks the next task, and completes it. This prevents the AI from getting confused by long conversations.

### `.mcp.json` - Playwright Configuration

This tells Claude Code to use Playwright, a tool for automating browsers. The AI uses this to:
- Open your app in a browser
- Take screenshots to verify things work
- Check for errors

**Why it exists:** Visual verification catches bugs that code review might miss. If a button doesn't appear, the screenshot shows it.

### `.claude/settings.json` - Safety Settings

This limits what the AI can do. It allows Playwright but blocks dangerous commands.

**Why it exists:** Since this workflow requires Ultimate YOLO mode, you want a few guardrails on what it can't do, just so that it doesn't blow up your computer.

### `.claude/commands/prd.md` - The /prd Command

This is a custom command that guides you through creating a Product Requirements Document. When you type `/prd` in Claude Code, it activates this workflow.

**Why it exists:** A good PRD is the foundation of your project. This command asks you the right questions to get you to explain your idea and convert that into a document that the AI can build from.

### `.claude/commands/plan.md` - The /plan Command

This command reads your PRD and converts it into a structured task list (plan.md).

**Why it exists:** Manually creating the JSON task list would be tedious and error-prone. This command does it automatically and apparently Claude likes this JSON format for tasks.

---

## Step-by-Step: Building Your First App

### Step 1: Download and Set Up the Template

1. On this GitHub page, click the green **"Code"** button
2. Click **"Download ZIP"**
3. Unzip the downloaded file
4. Rename the folder to your project name (e.g., `habit-tracker`)
5. Move it to your development folder (e.g., `~/dev/`)

Then open Terminal:

```bash
# Go to your project
cd ~/dev/habit-tracker

# Make the script executable
chmod +x ralph.sh

# Create screenshots folder
mkdir -p screenshots

# Initialize git for your project
git init
```

**What just happened?** You created a fresh project with all the Ralph Wiggum files ready to go. The ZIP download doesn't include any `.git` folder, so you start completely clean.

---

### Step 2: Start Claude Code

Open Claude Code in your project folder:

```bash
claude
```

You should see the Claude Code prompt. You're now ready to create your PRD!

---

### Step 3: Create Your PRD with `/prd`

Type the following command:

```
/prd
```

**What happens:** Claude activates the PRD Creator workflow. It will ask you questions ONE AT A TIME about your project idea. This is intentional - it's easier to think through one question at a time.

**The questions will cover:**
1. What problem are you solving?
2. Who will use this?
3. What features do you need?
4. What platform (web, mobile, etc.)?
5. Do you have any designs?
6. What data needs to be stored?
7. Do you need user accounts?
8. Any integrations (payments, maps, etc.)?
9. How many users do you expect?
10. Any constraints or challenges?

**Example conversation:**
```
Claude: What problem are you trying to solve?

You: I want a simple habit tracker where I can add habits I want to build,
     check them off each day, and see my streaks.

Claude: Great! Who will use this application?

You: Just me, for personal use. Maybe I'll share it with friends later.

Claude: What are the absolute must-have features for v1?

You: - Add a new habit with a name
     - See all my habits in a list
     - Check off a habit for today
     - See my current streak for each habit
     - Delete a habit I don't want anymore
```

**After all questions:** Claude creates a file called `PRD-[YourProjectName]-[Date].md` with everything organized professionally.

**Why we do this:** A PRD forces you to think through your idea before coding starts. It's like a blueprint for a house - you wouldn't start building without plans. The AI also builds better when it has clear requirements.

---

### Step 4: Generate Your Task Plan with `/plan`

Now convert your PRD into a task list:

```
/plan
```

**What happens:** Claude reads your PRD file and creates a structured `plan.md` with all the tasks needed to build your app.

**Example output:**
```
Created plan.md with 12 tasks across 4 categories:

Setup:
1. Initialize project structure
2. Set up development environment

Features:
3. Create habit data model
4. Build "add habit" form
5. Display habit list
6. Implement daily check-off
7. Calculate and display streaks
8. Add delete habit functionality

UI:
9. Style the habit list
10. Add streak visualization
11. Create responsive layout

Polish:
12. Add loading states and error handling
```

**Review the plan!** Open `plan.md` and make sure:
- The tasks make sense
- Nothing important is missing
- The order is logical

You can edit `plan.md` manually if needed - it's just JSON.

---

### Step 5: Run Ralph (The Autonomous Build)

Exit Claude Code first:
```
/exit
```

Then run the autonomous build:

```bash
./ralph.sh 20
```

The `20` means "run up to 20 iterations." Each iteration completes one task.

**What happens now:**
1. The script starts Claude in "headless" mode (no conversation, just work)
2. Claude reads `plan.md`, finds incomplete tasks
3. Claude picks the **highest priority task** (it uses judgment, not just order)
4. Claude completes all steps for that task
5. Claude tests it with Playwright (takes a screenshot)
6. Claude logs what it did in `activity.md`
7. Claude marks the task complete in `plan.md` (`"passes": true`)
8. Claude makes a git commit
9. The script starts the next iteration
10. Repeat until all tasks are done

**You'll see output like:**
```
==========================================
  ITERATION 1 of 20
==========================================

[Claude working on "Initialize project structure"...]
- Created package.json
- Installed dependencies
- Set up folder structure

--- Iteration 1 complete ---

==========================================
  ITERATION 2 of 20
==========================================

[Claude working on "Create habit data model"...]
```

---

### Step 6: Monitor Progress

While Ralph runs, you can open another terminal and check:

**See the activity log:**
```bash
cat activity.md
```

**See which tasks are done:**
```bash
cat plan.md | grep -A2 '"passes"'
```

**See all commits:**
```bash
git log --oneline
```

**Look at screenshots:**
```bash
ls screenshots/
open screenshots/  # On Mac, opens in Finder
```

---

### Step 7: When It Finishes

When all tasks are complete, you'll see:

```
==========================================
  ALL TASKS COMPLETE!
  Finished after 12 iterations
==========================================
```

**Now what?**
1. Look through `screenshots/` to see what was built
2. Test the app yourself (usually `npm start` or `python -m http.server`)
3. If something's wrong, you can:
   - Fix it manually
   - Add a new task to `plan.md` and run Ralph again

---

## The Complete Workflow Summary

```
┌─────────────────────────────────────────────────────────────────┐
│  1. SETUP                                                        │
│     mkdir my-app && cp -r ralph_template/. my-app/              │
│     cd my-app && chmod +x ralph.sh && git init                  │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  2. CREATE PRD                                                   │
│     claude                  # Start Claude Code                  │
│     /prd                    # Answer questions about your idea  │
│     → Creates PRD-[Name].md                                     │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  3. GENERATE PLAN                                                │
│     /plan                   # Convert PRD to task list          │
│     → Creates/updates plan.md                                   │
│     Review and edit if needed                                   │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  4. BUILD                                                        │
│     /exit                   # Exit Claude Code                   │
│     ./ralph.sh 20           # Run autonomous build              │
│     → AI builds your app task by task                           │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  5. REVIEW                                                       │
│     Check screenshots/      # Visual verification               │
│     Check activity.md       # What the AI did                   │
│     Test the app yourself                                       │
└─────────────────────────────────────────────────────────────────┘
```

---

## Common Questions

### "What if Ralph gets stuck?"

If the same task fails multiple times:
1. Stop Ralph with `Ctrl+C`
2. Look at `activity.md` to see what went wrong
3. You might need to:
   - Simplify the task in `plan.md` (break it into smaller steps)
   - Manually fix an issue the AI couldn't solve
   - Add a prerequisite task that's missing

### "What if I want to change something?"

You can edit any file at any time:
- Edit `plan.md` to add, remove, or modify tasks
- Edit `PROMPT.md` to change how the AI works
- Edit the code files Claude created

Then run `./ralph.sh 20` again to continue.

### "How do I add more tasks after Ralph finishes?"

1. Open `plan.md`
2. Add new task objects to the JSON array
3. Make sure `"passes": false` for new tasks
4. Run `./ralph.sh 20` again

### "What's with the 20 number?"

That's the maximum number of iterations. If your plan has 12 tasks, it might finish in 12-15 iterations. If you set it too low (like 5), it might stop before finishing.

Guidelines:
- Small project (5-10 tasks): Use 15
- Medium project (10-20 tasks): Use 25
- Large project (20+ tasks): Use 40

### "Can I stop in the middle?"

Yes! Press `Ctrl+C` at any time. Your progress is saved in:
- `plan.md` (completed tasks are marked `"passes": true`)
- `activity.md` (log of what happened)
- Git commits (all code changes)

Just run `./ralph.sh 20` again to continue where you left off.

### "How do I start completely over?"

If you want to rebuild from scratch:
```bash
# See how many commits were made
git log --oneline | wc -l

# Undo all commits (replace 15 with your number)
git reset --hard HEAD~15

# Reset all tasks to incomplete
# Edit plan.md and change all "passes": true to "passes": false

# Delete generated files
rm -rf node_modules dist build

# Run again
./ralph.sh 20
```

---

## Tips for Success

### 1. Be Specific in Your PRD

**Bad:** "I want a nice-looking app"
**Good:** "I want a clean design with a white background, blue accent color (#3B82F6), and the Inter font"

**Bad:** "Users can manage their stuff"
**Good:** "Users can create, edit, and delete their habits. Each habit has a name and tracks daily completion."

### 2. Review the Plan Before Running

Spend 5 minutes reading `plan.md` before running Ralph:
- Does the order make sense?
- Are there missing steps?
- Are any tasks too big? (Break them up)

It's much easier to fix the plan than to fix broken code.

### 3. Start Small

For your first Ralph project, try something simple:
- A todo list
- A calculator
- A timer/stopwatch
- A simple landing page
- A habit tracker

Once you're comfortable, tackle bigger projects.

### 4. Learn From the Code

After Ralph finishes, spend time reading the code it created. Ask Claude Code to explain parts you don't understand:

```
claude
> Can you explain what the useEffect hook does in src/App.jsx?
```

This is a great way to learn programming!

### 5. Don't Be Afraid to Intervene

If Ralph is struggling with a task:
1. Stop it (`Ctrl+C`)
2. Look at what it tried
3. Either fix it manually or simplify the task
4. Continue with `./ralph.sh 20`

You're the pilot. Ralph is your autopilot. Sometimes you need to take the controls.

---

## Quick Reference Card

```
SETUP NEW PROJECT:
  1. Download ZIP from GitHub (Code → Download ZIP)
  2. Unzip and rename folder to your project name
  3. cd ~/dev/your-project
  4. chmod +x ralph.sh
  5. mkdir screenshots
  6. git init

WORKFLOW:
  claude           # Start Claude Code
  /prd             # Create requirements (answer questions)
  /plan            # Generate task list
  /exit            # Exit Claude Code
  ./ralph.sh 20    # Build autonomously

KEY FILES:
  PRD-*.md         Your requirements document
  plan.md          Task list (JSON) - edit to add/change tasks
  activity.md      Progress log - see what AI did
  screenshots/     Visual proof of each feature

MONITORING:
  cat activity.md          # See progress log
  cat plan.md              # See task status
  git log --oneline        # See commits
  ls screenshots/          # See visual tests

CONTROLS:
  Ctrl+C           Stop Ralph
  ./ralph.sh 20    Resume building
```

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "command not found: claude" | Install Claude Code: `npm install -g @anthropic-ai/claude-code` |
| "/prd doesn't work" | Make sure you copied `.claude/commands/` folder |
| "ralph.sh permission denied" | Run `chmod +x ralph.sh` |
| "Playwright errors" | Check `.mcp.json` exists, run `npx playwright install` |
| "Task keeps failing" | Break it into smaller tasks in `plan.md` |
| "AI made a mistake" | Use `git revert` or fix manually, continue with Ralph |

---


Most of this was copied from the following guides: 
- https://github.com/ghuntley/how-to-ralph-wiggum
- https://github.com/JeredBlu/guides/blob/main/Ralph_Wiggum_Guide.md

Happy building!

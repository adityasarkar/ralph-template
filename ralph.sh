#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./ralph.sh <max-iterations>"
  echo "Example: ./ralph.sh 20"
  exit 1
fi

mkdir -p screenshots

for ((i=1; i<=$1; i++)); do
  echo ""
  echo "=========================================="
  echo "  ITERATION $i of $1"
  echo "=========================================="
  echo ""

  result=$(claude -p "$(cat PROMPT.md)" --output-format text  --dangerously-skip-permissions 2>&1) || true

  echo "$result"

  if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
    echo ""
    echo "=========================================="
    echo "  ALL TASKS COMPLETE!"
    echo "  Finished after $i iterations"
    echo "=========================================="
    exit 0
  fi

  echo ""
  echo "--- Iteration $i complete ---"
  sleep 2
done

echo ""
echo "Reached max iterations ($1) without completing all tasks."
echo "Check activity.md and plan.md to see progress."
exit 1

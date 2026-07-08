#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')
dir=$(basename "$cwd")

# Bold blue for directory name
printf '\033[1;34m%s\033[0m' "$dir"

# Bold green for git branch (skip optional locks)
branch=$(git -C "$cwd" -c core.hooksPath=/dev/null --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
if [ -n "$branch" ]; then
  printf ' \033[1;32m%s\033[0m' "$branch"

  # Green dot for staged changes
  if ! git -C "$cwd" --no-optional-locks diff --cached --quiet 2>/dev/null; then
    printf '\033[0;32m●\033[0m'
  fi

  # Yellow dot for unstaged changes
  if ! git -C "$cwd" --no-optional-locks diff --quiet 2>/dev/null; then
    printf '\033[0;33m●\033[0m'
  fi

  # Red dot for untracked files
  if [ -n "$(git -C "$cwd" --no-optional-locks ls-files --others --exclude-standard 2>/dev/null)" ]; then
    printf '\033[0;31m●\033[0m'
  fi
fi

# Session name (dim white)
session_name=$(echo "$input" | jq -r '.session_name // empty')
if [ -n "$session_name" ]; then
  printf ' \033[2;37m%s\033[0m' "$session_name"
fi

# Model display name (dim cyan)
model=$(echo "$input" | jq -r '.model.display_name // empty')
if [ -n "$model" ]; then
  printf ' \033[2;36m%s\033[0m' "$model"
fi

# Effort level (dim yellow), only when present
effort=$(echo "$input" | jq -r '.effort.level // empty')
if [ -n "$effort" ]; then
  printf ' \033[2;33m[%s]\033[0m' "$effort"
fi

# Context used percentage (dim magenta), only after first message
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used" ]; then
  printf ' \033[2;35mctx:%.0f%%\033[0m' "$used"
fi

# Vim mode (bold, color by mode)
vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')
if [ -n "$vim_mode" ]; then
  case "$vim_mode" in
    INSERT)      printf ' \033[1;32m%s\033[0m' "$vim_mode" ;;
    NORMAL)      printf ' \033[1;34m%s\033[0m' "$vim_mode" ;;
    VISUAL*)     printf ' \033[1;35m%s\033[0m' "$vim_mode" ;;
    *)           printf ' \033[1;37m%s\033[0m' "$vim_mode" ;;
  esac
fi

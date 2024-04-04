#!/bin/bash

GIT_COLOR="#f14e32"
git_color_text() {
  text=$1
  gum style --foreground "$GIT_COLOR" "$text"
}

get_status_files() {
  gum choose --no-limit $(git status -s -u)
}

gum style \
  --border normal \
  --margin "1" \
  --padding "1" \
  --border-foreground "$GIT_COLOR" \
  "$(git_color_text "🚀 Rahul") Git Branch Manager"


echo "Choose $(git_color_text "branches") to operate on:"
branches=$(get_status_files)

echo "Choose a $(git_color_text "command"):"
command=$(gum choose add)

echo $branches | tr " " "\n" | while read file
do
  case $command in
    add)
      echo "Adding $file"
      git add $file
      filename=$(basename "$file")
      commit_message=$(gum input --placeholder "Give commit intent")
      git commit -m "$filename : $commit_message"
      echo "Last Commit Message was $(git log -1 --pretty=%B)"
    ;;
  esac
done

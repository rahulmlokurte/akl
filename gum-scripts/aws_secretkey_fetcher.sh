#!/bin/bash

# Display a title
gum style --border double --margin "2" --align center --foreground 212 "🔐 AWS Secret Key Fetcher"

# Provide a prompt message to the user
gum style --border rounded --margin "1" --align center --foreground 39 "Please choose the Secret ID from the list below:"

SECRET_ID=$(gum choose --height 15 \
  /secret/test1 \
  /secret/test2)

# Display the selected secret ID for confirmation with some styling
gum style --border rounded --margin "1" --align center --foreground 34 "You selected: $SECRET_ID"

# Prompt the user for the Secret Name
SECRET_NAME=$(gum input --placeholder 'Enter the secret Name to extract (e.g., testing.url)' --prompt "🔍 Secret Name: " --width 60)
# Fetch the secret value from AWS Secrets Manager
SECRET_KEY=$(aws secretsmanager get-secret-value --secret-id "$SECRET_ID" --query SecretString --output text --no-verify | jq -r --arg name "$SECRET_NAME" '.[$name]')

# Display the spinner and fetch the secret key
gum spin --spinner dot --title "Fetching secret for....$SECRET_NAME" -- sleep 1

# Display the result with some styling
gum style --border rounded --margin "2" --align center --foreground 34 "Secret Key Retrieved for : $SECRET_NAME"
gum style --foreground 214 "$SECRET_KEY"


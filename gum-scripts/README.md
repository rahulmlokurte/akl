# 🔐 AWS Secret Key Fetcher

This folder contains a Bash script that interactively fetches a secret key from AWS Secrets Manager. The script leverages the `gum` command-line tool to provide a user-friendly interface with stylish prompts, selections, and feedback.

## Features

- **Interactive Selection**: Allows users to select a secret ID from a predefined list.
- **User Prompting**: Prompts the user to input the specific secret name they want to retrieve.
- **Styled Output**: Displays results and prompts with custom styling using `gum`.
- **Loading Spinner**: Provides a visual indication while fetching the secret key.

## Prerequisites

Before running the script, ensure you have the following installed:

- **AWS CLI**: For interacting with AWS Secrets Manager.
- **`jq`**: A command-line JSON processor used to parse the secret value.
- **`gum`**: A command-line tool that adds interactivity to your shell scripts. You can install it via [Homebrew](https://brew.sh/) or [Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux):

  ```bash
  brew install gum

## Script Breakdown

1. Display Title

```
gum style --border double --margin "2" --align center --foreground 212 "🔐 AWS Secret Key Fetcher"

```
- Displays a stylish title for the script.

2. Secret ID Selection

```
SECRET_ID=$(gum choose --height 15 \
  /secret/test1 \
  /secret/test2)
  
```
- Prompts the user to choose from a list of secret IDs.

3. Secret Name Input

```
SECRET_NAME=$(gum input --placeholder 'Enter the secret Name to extract (e.g., testing.url)' --prompt "🔍 Secret Name: " --width 60)

```
- Prompts the user to input the specific secret name.

4. Fetch and Display the Secret Key

```
SECRET_KEY=$(aws secretsmanager get-secret-value --secret-id "$SECRET_ID" --query SecretString --output text --no-verify | jq -r --arg name "$SECRET_NAME" '.[$name]')
```
- Fetches the secret value and extracts the specified key using jq.

5. Display the Result

```
gum style --border rounded --margin "2" --align center --foreground 34 "Secret Key Retrieved for : $SECRET_NAME"
gum style --foreground 214 "$SECRET_KEY"
```
- Displays the retrieved secret key with custom styling.

## Notes

- The secret IDs in the script are project-specific. Replace them with your own secret IDs.
- Make sure you have the necessary AWS CLI permissions to access the secrets.
- The script assumes a flat JSON structure in the secret string. Adjust the jq command if your secrets have a different structure.
### Check for .gitignore files
find . -name ".gitignore"

### Check if repo using a global .gitignore
git config --get core.excludesFile

To add a file to a gitignore: echo "my-secret-config.txt" >> .gitignore

To add a file to a global gitignore: echo "my-secret-config.txt" >> ~/.gitignore_global
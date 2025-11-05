# git
git config --global user.name "Name"
git config --global user.email "you@example.com"

git clone https://github.com//<username>/<name>.git
cd <name>

git add . # Stage
git status
git diff --cached # Diff
git commit -m "Message" # Commit
git push origin main # Push

git fetch origin 
git pull origin main
git status

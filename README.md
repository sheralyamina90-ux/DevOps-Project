# DevOps Laboratory Project

A small student-information application for demonstrating Linux, Git, Docker, Docker Compose and Jenkins.

## 1. Update the student information
Edit `app/info.txt`, or provide these environment variables:
- `STUDENT_NAME`
- `STUDENT_SURNAME`
- `STUDENT_GROUP`
- `STUDENT_ID`

## 2. Run locally with Python
```bash
python app/main.py
```

## 3. Build and run with Docker
```bash
docker build -t your-surname-your-name-devops .
docker run --rm -e STUDENT_NAME="YourName" -e STUDENT_SURNAME="YourSurname" -e STUDENT_GROUP="YourGroup" -e STUDENT_ID="YourID" your-surname-your-name-devops
```

## 4. Docker Compose
```bash
docker compose up --build
docker compose down
```

## 5. Git workflow example
```bash
git init
git add .
git commit -m "Initial project structure"
git switch -c development
# Make a real edit to README.md or app/info.txt
git add .
git commit -m "Update student project details"
git switch -c main  # only if main does not exist; otherwise use: git switch main
git merge development
```
Use meaningful commits for actual changes. Do not invent commits or claim a pipeline succeeded unless it ran successfully.

## 6. Jenkins
The `Jenkinsfile` contains the five required stages. It assumes a Jenkins agent where Python and Docker CLI are available and Docker is accessible. Configure the Jenkins job to use your GitHub repository and add student details as environment variables or update the Jenkinsfile placeholders.

#!/usr/bin/env bash
set -e

if [ -f "app/info.txt" ]; then
  while IFS='=' read -r key value; do
    case "$key" in
      STUDENT_NAME) STUDENT_NAME="${STUDENT_NAME:-$value}" ;;
      STUDENT_SURNAME) STUDENT_SURNAME="${STUDENT_SURNAME:-$value}" ;;
      STUDENT_GROUP) STUDENT_GROUP="${STUDENT_GROUP:-$value}" ;;
      STUDENT_ID) STUDENT_ID="${STUDENT_ID:-$value}" ;;
    esac
  done < app/info.txt
fi

echo "DevOps system information"
echo "Student: ${STUDENT_NAME:-[Your name]} ${STUDENT_SURNAME:-[Your surname]}"
echo "Group: ${STUDENT_GROUP:-[Your group]}"
echo "Student ID: ${STUDENT_ID:-[Your ID]}"
echo "User: $(whoami)"
echo "Host: $(hostname)"
echo "Date: $(date)"

if [ -f "app/info.txt" ]; then
  echo "Student information file: found"
else
  echo "Student information file: not found"
fi

echo "--- Disk usage ---"
df -h .
echo "--- Memory usage ---"
free -h 2>/dev/null || echo "free command is not available in this environment"

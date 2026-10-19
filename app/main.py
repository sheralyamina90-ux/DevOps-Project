import os
from pathlib import Path

def get_value(key, fallback):
    return os.getenv(key, fallback).strip() or fallback

def main():
    defaults = {}
    info_path = Path(__file__).with_name("info.txt")
    if info_path.exists():
        for line in info_path.read_text(encoding="utf-8").splitlines():
            if "=" in line:
                key, value = line.split("=", 1)
                defaults[key.strip()] = value.strip()

    name = get_value("STUDENT_NAME", defaults.get("STUDENT_NAME", "[Your name]"))
    surname = get_value("STUDENT_SURNAME", defaults.get("STUDENT_SURNAME", "[Your surname]"))
    group = get_value("STUDENT_GROUP", defaults.get("STUDENT_GROUP", "[Your group]"))
    student_id = get_value("STUDENT_ID", defaults.get("STUDENT_ID", "[Your ID]"))

    print("DevOps laboratory application")
    print(f"Name: {name}")
    print(f"Surname: {surname}")
    print(f"Group: {group}")
    print(f"Student ID: {student_id}")
    print("Application started successfully.")

if __name__ == "__main__":
    main()

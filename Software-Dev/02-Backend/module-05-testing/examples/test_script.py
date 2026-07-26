#!/usr/bin/env python3
"""
API Test Script — Calculator + To-Do + Quiz Backend
Replace YOUR_API_URL with your actual backend URL.
"""

import requests

BASE_URL = "http://localhost:5000/api"

def test_get_questions():
    """Test GET /questions endpoint"""
    response = requests.get(f"{BASE_URL}/questions")
    print(f"GET /questions -> {response.status_code}")
    assert response.status_code == 200, f"Expected 200, got {response.status_code}"
    data = response.json()
    assert "data" in data or isinstance(data, list), "Response should contain data"
    print("  PASS")

def test_post_question():
    """Test POST /questions endpoint"""
    payload = {
        "title": "Test Question",
        "options": ["A", "B", "C"],
        "answer": "A",
        "category": "test"
    }
    response = requests.post(f"{BASE_URL}/questions", json=payload)
    print(f"POST /questions -> {response.status_code}")
    assert response.status_code == 201, f"Expected 201, got {response.status_code}"
    print("  PASS")

def test_get_tasks():
    """Test GET /tasks endpoint"""
    response = requests.get(f"{BASE_URL}/tasks")
    print(f"GET /tasks -> {response.status_code}")
    assert response.status_code == 200, f"Expected 200, got {response.status_code}"
    print("  PASS")

def test_post_task():
    """Test POST /tasks endpoint"""
    payload = {"title": "Test task", "completed": False}
    response = requests.post(f"{BASE_URL}/tasks", json=payload)
    print(f"POST /tasks -> {response.status_code}")
    assert response.status_code == 201, f"Expected 201, got {response.status_code}"
    print("  PASS")

def test_delete_task(task_id=1):
    """Test DELETE /tasks/:id endpoint"""
    response = requests.delete(f"{BASE_URL}/tasks/{task_id}")
    print(f"DELETE /tasks/{task_id} -> {response.status_code}")
    assert response.status_code == 204, f"Expected 204, got {response.status_code}"
    print("  PASS")

if __name__ == "__main__":
    print("Running API tests...\n")
    try:
        test_get_questions()
    except Exception as e:
        print(f"  FAIL — {e}")
    try:
        test_post_question()
    except Exception as e:
        print(f"  FAIL — {e}")
    try:
        test_get_tasks()
    except Exception as e:
        print(f"  FAIL — {e}")
    try:
        test_post_task()
    except Exception as e:
        print(f"  FAIL — {e}")
    try:
        test_delete_task()
    except Exception as e:
        print(f"  FAIL — {e}")
    print("\nDone.")
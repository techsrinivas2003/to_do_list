# app.py

from flask import Flask, render_template, request, redirect

app = Flask(__name__)

# Sample in-memory list of to-do items (in a real app, this would be stored in a database)
tasks = [
    {"id": 1, "task": "Learn Python", "completed": False},
    {"id": 2, "task": "Build a Flask app", "completed": False}
]

# Route for the homepage that shows the list of tasks
@app.route('/')
def index():
    return render_template('index.html', tasks=tasks)

# Route to add a new task
@app.route('/add', methods=['POST'])
def add_task():
    task = request.form.get('task')  # Get task from the form input
    if task:
        new_task = {
            "id": len(tasks) + 1,
            "task": task,
            "completed": False
        }
        tasks.append(new_task)
    return redirect('/')

# Route to mark a task as completed
@app.route('/complete/<int:task_id>')
def complete_task(task_id):
    for task in tasks:
        if task['id'] == task_id:
            task['completed'] = True
            break
    return redirect('/')

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)

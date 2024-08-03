function createTodoItem() {
  const todoText = document.getElementById('todoText').value;
  if (!todoText.trim()) {
    alert('Please enter a task');
    return;
  }

  fetch('/tasks', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    },
    body: JSON.stringify({ task: { name: todoText } })
  })
  .then(response => response.json())
  .then(data => {
    // Handle success (e.g., update the UI with the new task)
    console.log('Task created:', data);
    document.getElementById('todoText').value = ''; // Clear input field
  })
  .catch(error => {
    console.error('Error:', error);
  });
}

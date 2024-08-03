document.addEventListener('DOMContentLoaded', () => {
  const todoValue = document.getElementById("todoText");
  const listItems = document.getElementById("list-items");
  const addUpdate = document.getElementById("AddUpdateClick");

  // Load existing tasks from localStorage
  let todo = JSON.parse(localStorage.getItem("todo-list")) || [];

  // Display tasks
  function displayTasks() {
    listItems.innerHTML = '';
    todo.forEach((item, index) => {
      listItems.innerHTML += `
        <div class="todo-item">
          <span>${item}</span>
          <button onclick="removeTask(${index})">Remove</button>
        </div>
      `;
    });
  }

  // Add task
  function addTask() {
    if (todoValue.value.trim() !== '') {
      todo.push(todoValue.value.trim());
      localStorage.setItem("todo-list", JSON.stringify(todo));
      todoValue.value = ''; // Clear input field
      displayTasks(); // Update task list display
    }
  }

  // Remove task
  window.removeTask = function(index) {
    todo.splice(index, 1);
    localStorage.setItem("todo-list", JSON.stringify(todo));
    displayTasks(); // Update task list display
  }

  // Attach event listener
  addUpdate.addEventListener('click', addTask);

  // Initial display of tasks
  displayTasks();
});

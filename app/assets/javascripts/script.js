document.addEventListener('DOMContentLoaded', () => {
  const addButton = document.getElementById('AddUpdateClick');
  const todoText = document.getElementById('todoText');
  const listItems = document.getElementById('list-items');

  const loadTasks = () => {
    const tasks = JSON.parse(localStorage.getItem('tasks')) || [];
    tasks.forEach(task => addTaskToDOM(task, false));
  };


  const saveTasks = () => {
    const tasks = [];
    document.querySelectorAll('.task-item').forEach(taskItem => {
      const taskContent = taskItem.querySelector('.task-content').textContent.trim();
      const taskNote = taskItem.querySelector('.task-note').value.trim();
      const completed = taskItem.style.textDecoration === 'line-through';
      tasks.push({ content: taskContent, note: taskNote, completed });
    });
    localStorage.setItem('tasks', JSON.stringify(tasks));
  };


  const addTaskToDOM = (task, save = true) => {
    const taskItem = document.createElement('div');
    taskItem.className = 'task-item';
    if (task.completed) {
      taskItem.style.textDecoration = 'line-through';
    }

    const taskContent = document.createElement('div');
    taskContent.className = 'task-content';
    taskContent.textContent = task.content;
    taskItem.appendChild(taskContent);

    const taskNote = document.createElement('textarea');
    taskNote.className = 'task-note';
    taskNote.value = task.note;
    taskNote.style.display = task.note ? 'block' : 'none';
    taskItem.appendChild(taskNote);

    const taskControls = document.createElement('div');
    taskControls.className = 'task-controls';

    const addNoteButton = document.createElement('button');
    addNoteButton.textContent = 'Add Note';
    addNoteButton.addEventListener('click', () => {
      taskNote.style.display = taskNote.style.display === 'none' ? 'block' : 'none';
      saveTasks();
    });

    const editButton = document.createElement('button');
    editButton.textContent = 'Edit';
    editButton.addEventListener('click', () => {
      if (taskContent.isContentEditable) {
        taskContent.contentEditable = 'false';
        editButton.textContent = 'Edit';
        saveTasks();
      } else {
        taskContent.contentEditable = 'true';
        editButton.textContent = 'Save';
      }
    });

    const deleteButton = document.createElement('button');
    deleteButton.textContent = 'Delete';
    deleteButton.addEventListener('click', () => {
      listItems.removeChild(taskItem);
      saveTasks();
    });

    const completeButton = document.createElement('button');
    completeButton.textContent = 'Complete';
    completeButton.addEventListener('click', () => {
      taskItem.style.textDecoration = 'line-through';
      saveTasks();
    });

    taskControls.appendChild(addNoteButton);
    taskControls.appendChild(editButton);
    taskControls.appendChild(deleteButton);
    taskControls.appendChild(completeButton);

    taskItem.appendChild(taskControls);
    listItems.appendChild(taskItem);

    if (save) {
      saveTasks();
    }
  };


  addButton.addEventListener('click', () => {
    const text = todoText.value.trim();
    if (text) {
      const task = { content: text, note: '', completed: false };
      addTaskToDOM(task);
      todoText.value = '';
    }
  });


  todoText.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
      addButton.click();
    }
  });

 
  loadTasks();
});

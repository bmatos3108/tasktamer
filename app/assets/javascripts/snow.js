document.addEventListener("DOMContentLoaded", function() {

  const snowContainer = document.createElement('div');
  snowContainer.className = 'snowflakes';
  document.body.appendChild(snowContainer);

  
  for (let i = 0; i < 100; i++) {
    const snowflake = document.createElement('div');
    snowflake.className = 'snowflake';

    snowflake.style.left = `${Math.random() * 100}vw`;
    snowflake.style.fontSize = `${Math.random() * 10 + 10}px`;
    snowflake.style.animationDuration = `${Math.random() * 10 + 5}s`;
    snowContainer.appendChild(snowflake);
  }
});

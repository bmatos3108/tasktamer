document.addEventListener("DOMContentLoaded", function() {
  // Create and append the container for snowflakes
  const snowContainer = document.createElement('div');
  snowContainer.className = 'snowflakes';
  document.body.appendChild(snowContainer);

  // Create and append individual snowflakes
  for (let i = 0; i < 100; i++) {
    const snowflake = document.createElement('div');
    snowflake.className = 'snowflake';
    // Optional: Randomize initial position, size, or animation duration
    snowflake.style.left = `${Math.random() * 100}vw`;
    snowflake.style.fontSize = `${Math.random() * 10 + 10}px`; // Adjust size as needed
    snowflake.style.animationDuration = `${Math.random() * 10 + 5}s`; // Adjust duration as needed
    snowContainer.appendChild(snowflake);
  }
});

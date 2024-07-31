document.addEventListener("DOMContentLoaded", function() {
  const snowContainer = document.createElement('div');
  snowContainer.className = 'snowflakes';
  document.body.appendChild(snowContainer);

  for (let i = 0; i < 100; i++) {
      const snowflake = document.createElement('div');
      snowflake.className = 'snowflake';
      snowContainer.appendChild(snowflake);
  }
});

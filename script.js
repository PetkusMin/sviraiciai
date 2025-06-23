// Set the countdown target date and time (2025-07-26 21:00 EEST)
const countdownDate = new Date("2025-07-25T21:00:00+03:00").getTime();

// Function to update the countdown every second
const updateCountdown = () => {
  const now = new Date().getTime();
  const distance = countdownDate - now;

  // If the countdown is finished, display a message
  if (distance < 0) {
    document.getElementById("countdown").innerHTML = "The event has started!";
    return;
  }

  // Calculate days, hours, minutes, and seconds left
  const days = Math.floor(distance / (1000 * 60 * 60 * 24));
  const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Update the HTML elements with the calculated values
  document.getElementById("days").textContent = days;
  document.getElementById("hours").textContent = hours;
  document.getElementById("minutes").textContent = minutes;
  document.getElementById("seconds").textContent = seconds;
};

// Update the countdown every 1 second
setInterval(updateCountdown, 1000);

// Initial call to display countdown immediately
updateCountdown();

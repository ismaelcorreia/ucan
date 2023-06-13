

document.addEventListener("DOMContentLoaded", () => {
    const themeToggle = document.getElementById("theme-toggle");
    const page = document.getElementsByTagName('html')[0];
    const toggleLabel = document.getElementsByClassName('toggle-icon')[0];
 
    themeToggle.addEventListener("change", () => {
        page.classList.toggle("dark-mode");
        if(page.classList.contains("dark-mode")) {
            toggleLabel.innerHTML = "nightlight";
        }else{
            toggleLabel.innerHTML = "brightness_7";

        }
    });


    const slides = document.querySelectorAll(".slide");
    let currentSlide = 0;

    function showSlide(slideIndex) {
      slides.forEach(function(slide) {
        slide.classList.remove("active");
      });
      slides[slideIndex].classList.add("active");
    }

    function nextSlide() {
      currentSlide++;
      if (currentSlide >= slides.length) {
        currentSlide = 0;
      }
      showSlide(currentSlide);
    }
    nextSlide();

    // setInterval(nextSlide, 2000);
  });

  
//   <i class="material-icons toggle-icon">brightness_7</i>

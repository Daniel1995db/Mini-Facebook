document.addEventListener("turbolinks:load", function(){

  const elNav = document.querySelector(".main-navigation");
  const elHam = document.querySelector(".nav-toggle");

  elHam.addEventListener("click", function(){
        elNav.classList.toggle("open");
    });
  });


const topHeader = document.querySelector(".top-header");
const topLink = document.querySelector(".pop");

window.addEventListener("scroll", function(){
  const scrollHeight = window.pageYOffset;
  const navHeight = topHeader.getBoundingClientRect().height;

  if(scrollHeight > navHeight){
    topHeader.classList.add('hide-top-header');
  }
  else{
    topHeader.classList.remove('hide-top-header');
  }

  if(scrollHeight > navHeight){
    topLink.classList.add('show-pop');
  }
  else{
    topLink.classList.remove('show-pop');
  }
});






const scrollToLastMessage =() => {
  if (document.querySelector(".message-container")) {
    [...document.querySelectorAll('.message-container')].pop().scrollIntoView({behavior:'smooth'})
  }
}

export {scrollToLastMessage};

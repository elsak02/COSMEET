import Swipe from 'swipejs';

const profileSwipe = () => {
  console.log("hello");
  if (document.getElementById('slider')) {
    window.mySwipe = new Swipe(document.getElementById('slider'), {
      startSlide: 0,
      auto: 0,
      draggable: false,
      autoRestart: false,
      continuous: false,
      disableScroll: true,
      stopPropagation: true,
      callback: function(index, elem, dir) {
        console.log('index', index);
        console.log('elem', elem);
        console.log('dir', dir);
        if (dir == 1) {
          console.log("swiped vers la droite");
          console.log(index)
          const likeAction = elem.querySelector('.new_like input[value="Like"]')
          const dislikeAction = elem.querySelector('.new_like input[type="Dislike"]')
          console.log(elem.querySelector('.new_like input[value="Like"]'));
          console.log(likeAction);
        } else if (dir == -1 ) {
          console.log("swiped vers la gauche");
          console.log(index)
          const likeAction = elem.querySelector('.new_like input[value="Like"]')
          const dislikeAction = elem.querySelector('.new_like input[type="Dislike"]')
          console.log(elem.querySelector('.new_like input[value="Like"]'));
          console.log(dislikeAction);
        }
      },
      transitionEnd: function(index, elem) {}
    });


    const btnsAction = document.querySelectorAll(".user-profile-actions input[type='submit']");

    btnsAction.forEach((btn) => {
      btn.addEventListener('click', (event) => {
        var target = event.currentTarget
        setTimeout(() => {
          target.closest(".user-profile-card").remove();
        }, 50)
      })
    })
  }
}

export { profileSwipe }

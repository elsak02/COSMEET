// import Swipe from 'swipejs';

const profileSwipe = () => {
  console.log("hello");

  $( document ).ready(function() {

    var profiles = $(document.querySelectorAll(".user-profile-card"));

    profiles.each(function() {

      // listen the swipe
      $(this).swipe({
        swipe:function(event, direction, distance, duration, fingerCount, fingerData) {

          var likeAction = $(this).find('.new_like input[value="Like"]')[0];
          var dislikeAction = $(this).find('.new_like input[value="Dislike"]')[0];

          // check direction of swipe and trigger the right button
          if (direction === "left") {
            dislikeAction.click();
            $(this).addClass("swipe-left")
          } else if (direction === "right") {
            likeAction.click();
            $(this).addClass("swipe-right")
          }
        },
        threshold:0,
        fingers:`all`
      });
    });
  });


  // const btnsAction = document.querySelectorAll(".user-profile-actions input[type='submit']");

  // btnsAction.forEach((btn) => {
  //   btn.addEventListener('click', (event) => {
  //     var target = event.currentTarget
  //     setTimeout(() => {
  //       target.closest(".user-profile-card").remove();
  //     }, 50)
  //   })
  // })
}

export { profileSwipe }

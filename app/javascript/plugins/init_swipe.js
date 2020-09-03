// import Swipe from 'swipejs';
import { fetchWithToken } from "../plugins/fetch_with_token";

const profileSwipe = () => {
  console.log("hello");

  $( document ).ready(function() {

    var profiles = $(document.querySelectorAll(".user-profile-card"));

    profiles.each(function() {

      // listen the swipe
      $(this).swipe({
        swipe:function(event, direction, distance, duration, fingerCount, fingerData) {

          // var likeAction = $(this).find('.new_like input[value="Like"]')[0];
          // var dislikeAction = $(this).find('.new_like input[value="Dislike"]')[0];
          console.log(this)
          const card = this[0]
          const receiverId = card.dataset.receiverId
          console.log(receiverId)
          // check direction of swipe and trigger the right button
          if (direction === "left") {
            // dislikeAction.click();
            postLike(receiverId, false)
            $(this).addClass("swipe-left")

          } else if (direction === "right") {
            // likeAction.click();
            postLike(receiverId, true)
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

const postLike = (receiver_id, liked) => {
  // Fetch "/likes"
  // Params: { like: { receiver_id: 2, liked: true }}
  fetchWithToken("/likes", {
    method: "POST",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ like: { receiver_id: receiver_id, liked: liked }})
  }).then(response => response.json())
    .then((data) => {
      console.log(data)
      // handle JSON response from server
    });
}

export { profileSwipe }

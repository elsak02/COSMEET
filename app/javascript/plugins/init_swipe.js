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
        swipeStatus: swipeStatus,
        threshold: 0,
        fingers: `all`,
        allowPageScroll: "vertical",
        triggerOnTouchEnd: true
      });
    });
  });
}

const swipeStatus = (event, phase, direction, distance) => {
  if (phase == "move" && (direction == "left" || direction == "right")) {
    var duration = 0;
    const img_width = 597

    if (direction == "left") {
        scrollImages($(this), (img_width) + distance, duration);
    } else if (direction == "right") {
        scrollImages($(this), (img_width) - distance, duration);
    }

  } else if (phase == "cancel") {
    scrollImages($(this), img_width, speed);
  }
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
      if (data.redirect_url) {
        window.location.replace(data.redirect_url)
      }
    });
}

const scrollImages = (element, distance, duration) => {
  element.css("transition-duration", (duration / 1000).toFixed(1) + "s");

  //inverse the number we set in the css
  var value = (distance < 0 ? "" : "-") + Math.abs(distance).toString();
  element.css("transform", "translate(" + value + "px,0)");
}

export { profileSwipe }

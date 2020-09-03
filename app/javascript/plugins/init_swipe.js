import { Stack, Card, Direction } from 'swing';
import { fetchWithToken } from "../plugins/fetch_with_token";

const profileSwipe = () => {
  const cards = document.querySelectorAll(".user-profile-card")
  console.log(Stack)
  // console.log(Swing)
  const stack = Stack({
    allowedDirections: [Direction.LEFT, Direction.RIGHT]
  });
  cards.forEach((card) => {
    // Add card element to the Stack.
    stack.createCard(card);
  });

  stack.on('throwout', (event) => {
    // e.target Reference to the element that has been thrown out of the stack.
    // e.throwDirection Direction in which the element has been thrown (Direction.LEFT, Direction.RIGHT).
    const currentCard = event.target
    if (event.throwDirection == Direction.LEFT) {
      postLike(currentCard.dataset.receiverId, false)
    } else {
      postLike(currentCard.dataset.receiverId, true)
    }
  });
  stack.on("throwoutend", (event) => {
    event.target.remove();
  })
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


export { profileSwipe }

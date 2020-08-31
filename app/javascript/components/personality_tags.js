const togglePersoTags = () => {
  const tags = document.querySelectorAll(".personality-traits label");
  tags.forEach((tag) => {
    tag.addEventListener("click", (event) => {
      // console.log(event.currentTarget);
      event.currentTarget.classList.toggle("checked");
    })

  })
}

export { togglePersoTags };

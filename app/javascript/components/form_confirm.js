const formConfirm = () => {
  const submitForm = document.querySelector("#submitFormBirth");
  submitForm.addEventListener("click", (event) => {
    event.preventDefault();
    event.currentTarget.submit();
  })
}

export { formConfirm };

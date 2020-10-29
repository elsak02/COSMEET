const displayInfosUser = () => {
  const submitForm = document.querySelector("#submitFormBirth");
  submitForm.addEventListener("click", (event) => {
    // event.preventDefault();
    const list = document.querySelector('#infosBirthUser');
    const year = document.querySelector('#user_birth_date_1i');
    const month = document.querySelector('#user_birth_date_2i');
    const day = document.querySelector('#user_birth_date_3i');
    const hour = document.querySelector('#user_birth_time_4i');
    const min = document.querySelector('#user_birth_time_5i');
    const place = document.querySelector('#user_birth_place');
    console.log(place);
    list.innerHTML = "";
    list.insertAdjacentHTML("beforeend", `<li>Vous êtes né(e) le ${day.value}/${month.value}/${year.value} à ${hour.value}:${min.value} </li>`);
    list.insertAdjacentHTML("beforeend", `<li>dans la ville de ${place.value.split(", ")[0]} </li>`);
  })
}

export { displayInfosUser };

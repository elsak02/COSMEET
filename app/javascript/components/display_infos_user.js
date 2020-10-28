const list = document.querySelector('#infosBirthUser');
const year = document.querySelector('#user_birth_date_1i');
const month = document.querySelector('#user_birth_date_2i');
const day = document.querySelector('#user_birth_date_3i');
const hour = document.querySelector('#user_birth_time_4i');
const min = document.querySelector('#user_birth_time_5i');
const place = document.querySelector('#user_birth_place');

const displayInfosUser = () => {
  list.insertAdjacentHTML("beforeend", `<li>Vous êtes né(e) le ${day.value}/${month.value}/${year.value} à ${hour.value}:${min.value} </li>`);
  list.insertAdjacentHTML("beforeend", `<li>dans la ville de ${place.value} </li>`);
}

export { displayInfosUser };

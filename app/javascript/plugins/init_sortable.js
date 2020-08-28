import Sortable from 'sortablejs';

const initSortable = () => {

  if (document.querySelector('.list-inline')) {

    const list = document.querySelector('.list-inline');
    const input = document.querySelector("#user_element_ranking, #user_mode_ranking");
    const sortable = Sortable.create(list, {
      ghostClass: "ghost",
      animation: 150,
      onEnd: function (/**Event*/evt) {
        let ranking = [];
        const listItems = list.querySelectorAll("li");
        listItems.forEach((item, index) => {
          // item.querySelector("span").innerText = index + 1 ;
          ranking.push(item.id);
        });
        const arrayRanking = Array.from(ranking);
        input.value = arrayRanking;
      },
    });
  }
}

export { initSortable };

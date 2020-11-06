import { slider } from "jquery-ui";


const ageSlider = () => {
  if (document.querySelector(".slider-input")) {
          const input = document.querySelector("#user_age_preference");
          const value = input.value === "" ? [18, 80] : input.value.split(" ").map((num) => parseInt(num));;
      $(".slider-input").slider({
        min: 18,
        max: 80,
        values: value,
        create: function(event,ui) {
          $(".slider-input").find(".ui-slider-handle:first").text($(".slider-input").slider("values", 0));
          $(".slider-input").find(".ui-slider-handle:last").text($(".slider-input").slider("values", 1));
        },
        slide: function(event, ui) {
          let lowestAge = $(".slider-input").slider("values", 0);
          let highestAge = $(".slider-input").slider("values", 1);
          $(".slider-input").find(".ui-slider-handle:first").text(lowestAge);
          $(".slider-input").find(".ui-slider-handle:last").text(highestAge);
          const input = document.querySelector("#user_age_preference");
          input.value = [lowestAge, highestAge];

        }
      });
    };
}


export { ageSlider };


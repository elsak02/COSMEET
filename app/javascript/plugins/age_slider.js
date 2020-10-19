import { slider } from "jquery-ui";

// const ageSlider = () => {
//   $( ".slider-input" ).slider({
//   range: true,
//   min: 18,
//   max: 80,
//   values: [ 18, 80 ],
//   step: 1,

// });
// }

const ageSlider = () => {
  if (document.querySelector(".slider-input")) {
      $(".slider-input").slider({
        min: 18,
        max: 80,
        values: [ 18, 80 ],
        create: function(event,ui) {
          $(".slider-input").find(".ui-slider-handle:first").text($(".slider-input").slider("values", 0));
          $(".slider-input").find(".ui-slider-handle:last").text($(".slider-input").slider("values", 1));
        },
        slide: function(event, ui) {
          let age_preference = []
          let lowestAge = $(".slider-input").slider("values", 0);
          let highestAge = $(".slider-input").slider("values", 1);
          $(".slider-input").find(".ui-slider-handle:first").text(lowestAge);
          $(".slider-input").find(".ui-slider-handle:last").text(highestAge);
          age_preference.push(lowestAge)
          age_preference.push(highestAge)
          const input = document.querySelector("#user_age_preference");
          //input.value = Array.from(age_preference)
          input.value = age_preference
          //input.value = `${lowestAge}, ${highestAge}`;
          console.log(input);
          console.log(input.value);
          // console.log(lowestAge);
          // console.log(highestAge);
          // const arrayAge = input.value.split(",");
          // console.log(arrayAge);
          // $("#user_age_preference").val([`${lowestAge}`, `${highestAge}`]);
          // console.log(input);
          // input.value = [lowestAge, highestAge];
          // console.log(input.value)
        }
      });
    };
}


export { ageSlider };

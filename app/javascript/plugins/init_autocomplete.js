import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('user_birth_place');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };

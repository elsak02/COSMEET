const callAPI = () => {

  var userId = '613958';
  var apiKey = '0b9271b4ac98aba3f3702ce2e0fb1a3b';
  var data = 'JSON Request Data';

  var request = $.ajax({
    url: "https://json.astrologyapi.com/v1/western_chart_data",
    method: "POST",
    dataType:'jsonp',
    crossDomain: true,
    headers: {
    "authorization": "Business " + btoa(userId+":"+apiKey),
    "Content-Type":'application/json'
    },
    data:JSON.stringify(data)
    });
    // Returns A promiss
    return (request.then(function(resp){
    console.log(resp);
    }, function(err){
    console.log(err);
    return err;
    }));
};

export { callAPI };

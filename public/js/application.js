$(document).ready(function() {

  $('#new_air').on('submit', function(event){
    event.preventDefault();
    formData = $(this).serialize();
    console.log(formData);

    // var lat = address_convert(formData)[0]
    // var lon = address_convert(formData)[1]
    // var apiURL = "https://api.breezometer.com/baqi/?lat=" + lat + "&lon=" + lon + "&key=4a694c2e3544448baa9d166a4f82332f"

    // $.ajax({
    //   url: apiURL,
    //   type: 'get'
    // }).done(function(response){
    //   console.log(response)
    // })


  })




})


  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


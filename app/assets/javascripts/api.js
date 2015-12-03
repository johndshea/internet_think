var value = $('#value').text();
console.log(value);

// Calls Giphy api on the header name and displays four results.
$(function(){
  var giphy_promise = $.ajax({
    url:'https://api.giphy.com/v1/gifs/search',
    method: "GET",
    data: {
      q: value,
      api_key: "dc6zaTOxFJmzC",
      limit: 4
    },
  });
  giphy_promise.done(function(data) {
    $('#giphy').html('');
    data.data.forEach(function(gif){
      $("#giphy").append('<div class="image_adjust"><p class="text-center"><a href="'+gif.bitly_gif_url+'"><img src="'+gif.images.original.url+'"></a></p></div>');
    });
  });
  giphy_promise.error(function(error) {
    console.log(error);
  });
});

// Calls Flickr api on the header name and displays four results.
$(function(){
  var flickr_promise = $.getJSON('https://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?',
  {
    tags: value,
    format: "json"
  });
  flickr_promise.done(function(data) {
    console.log(data);
    $('#flickr').html('');
    var image_count = 0;
    while(image_count < 4) {
        $("#flickr").append(data.items[image_count].description);
        image_count ++;
    }
  });
  flickr_promise.error(function(error) {
    console.log(error);
  });
});

// calls Google Image Search API, displays 4 results (apparently the single-page default)
google.load('search', '1');
var imageSearch;
function searchComplete() {
  // Check that we got results
  if (imageSearch.results && imageSearch.results.length > 0) {
    // Grab our content div, clear it.
    var contentDiv = document.getElementById('google_images');
    contentDiv.innerHTML = '';
    // Loop through our results, printing them to the page.
    var results = imageSearch.results;
    for (var i = 0; i < results.length; i++) {
      // For each result write it's title and image to the screen
      var result = results[i];
      var imgContainer = document.createElement('div');
      var title = document.createElement('div');
      // We use titleNoFormatting so that no HTML tags are left in the
      // title
      title.innerHTML = result.titleNoFormatting;
      var newImg = document.createElement('img');
      // There is also a result.url property which has the escaped version
      newImg.src= result.url; // "/image-search/v1/result.tbUrl;"
      imgContainer.appendChild(title);
      imgContainer.appendChild(newImg);
      // Put our title + image in the content
      contentDiv.appendChild(imgContainer);
    }
  }
}
var load_images = $(function(){
  // Create an Image Search instance.
  imageSearch = new google.search.ImageSearch();
  // Set searchComplete as the callback function when a search is
  // complete.  The imageSearch object will have results in it.
  imageSearch.setSearchCompleteCallback(this, searchComplete, null);
  // Find me a beautiful car.
  imageSearch.execute(value);
  // Include the required Google branding
  google.search.Search.getBranding('branding');
});

google.setOnLoadCallback(load_images);

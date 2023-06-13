function addToCart() {
  
  const endPoint = "http://localhost:8080/naturemarket/produto";
 
  // var form = new FormData();
  // form.append('productId', 1)

  $.ajax({
    url: endPoint,
    type: 'POST',
    data: { 
      produtoId: '1',
      produtoName: 'Ismael Correia',
    },
    contentType: "application/json; charset=utf-8",
    dataType: "json"
  }).done(function (resp) {
    console.log(resp)
});

}


$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 

  var carrusel = setInterval(function(){
  $(".carousel ul").animate({"marginLeft" : "-=300px"}, 1000, function(){
    $(this).find("li:last").after($(this).find("li:first"));
      $(this).css({marginLeft:0});
  })
  //alert()
  },5000)


  // Metodo sortable en listas de galeria
  $(function() {
    $( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
  });

});

$(document).ready(function() {		
	var oBannerTit = $("#bottom #banner ul li");
	var oNews = $("#left #news");
	var aArr=new Array();
	
	$("#bottom #banner ul li").click(function(){
	  $('html, body').animate( { scrollTop:2750 }, 100 );
	  $("#left").show();
	  var index = $(this).index();
	  oNews.eq(index).show().siblings().hide();
	  $("#left #banner").show();
	  $("#bottom #banner").hide();
    });
	
	for(var i=0; i<oBannerTit.length; i++){
		oBannerTit[i].index=i+1;
		aArr.push($('#bottom #banner ul li:nth-child('+oBannerTit[i].index+') .tit').html())
	}
	
	$("#left #news .box-heading").append('<label class="close" title="back">back</label>');
	
	$("#left #news .box-heading .close").click(function(){
		oNews.hide();$("#left").hide(); $("#bottom #banner").show();
	})
	
	for(var j=0; j<oNews.length; j++){
		oNews[j].index=j+2;
		$('#left #news:nth-child('+oNews[j].index+') span').html(aArr[j]);
	}

	$("#left #banner ul .img").append('<div class="new_banner"><h3>Nominated</h3> <h3>Equitana 2013</h3> <h3>Germany</h3><h3>Top 10 Equine</h3></h3><h3>Innovations</h3></div>');
	
	$("#bottom #news ul li h5").remove();
	$("#bottom #news .box-heading span").html("Video");
	

});


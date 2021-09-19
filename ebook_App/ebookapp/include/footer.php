<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<script type="text/javascript">
	$(document).ready(function(e) {
       $("#news_type").change(function(){
      
       var type=$("#news_type").val();
          
          if(type=="article")
          {
             
             $("#news_article_display").show();
             $("#news_video_display").hide();
          }
          else
          {   
                 
            $("#news_article_display").hide();               
            $("#news_video_display").show();

          }    
          
     	});
    });
</script>
<div class="container">
    <div class="col col-md-12" style="text-align: center; margin-top: 50px;">
        <h6>Made By: </h6>
        Power Render
    </div>
</div>
<script src="assets/jasny/js/bootstrap-fileupload.js"></script>
<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
<script src="assets/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script src="assets/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.js"></script>
<script src="assets/js/image_gallery.js"></script>
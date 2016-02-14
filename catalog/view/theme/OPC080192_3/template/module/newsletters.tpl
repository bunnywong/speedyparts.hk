<div class="column col-sm-3 newsletter">
<h5 class="news-title"><?php echo $heading_title; ?></h5>

<ul class="list-unstyled">
<li class="newstext"><?php echo $footernewstext; ?></li>
<li>
<div class="row">
	
	<form method="post">
		<div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $text_email; ?></label>
            <div class="col-sm-10 input-news">
              <input type="email" name="txtemail" id="txtemail" value="" style="font-style:italic;" placeholder="<?php echo $text_placeholder; ?>" class="form-control input-lg" />
            </div>
		</div>
		<div class="form-group required">
            <div class="col-sm-10 subscribe-btn">
              <button type="submit" class="btn btn-default btn-lg" onclick="return subscribe();"><?php echo $text_subscribe; ?></button>  
            </div>
		</div>
		</form>
          
</div>
</li>
</ul>
</div>
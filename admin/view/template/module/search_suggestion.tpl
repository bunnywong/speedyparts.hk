<?php echo $header; ?>

<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/jquery/ui/jquery-ui.theme.min.css" />
<style>
.disable {
  background-color: #EFEFEF !important;
}
.info {
  color: #FF0000;
  font-weight: bold;
}
</style>

<?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip_" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip_" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-search-suggestion" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-where" data-toggle="tab"><?php echo $tab_where; ?></a></li>
            <li><a href="#tab-fields" data-toggle="tab"><?php echo $tab_fields; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
									<select name="search_suggestion_status" id="input-status" class="form-control">
										<?php if ($search_suggestion_status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>          
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-search-order"><span data-toggle="tooltip_" title="<?php echo $help_search_order; ?>"><?php echo $search_order; ?></span></label>
								<div class="col-sm-10">
									<div class="row">
                    <div class="col-sm-6">
											<select name="search_suggestion_options[search_order]" id="input-search-order" class="form-control">
												<option value="name" <?php echo (isset($options['search_order']) && $options['search_order'] == 'name') ? 'selected="selected"' : "" ;?>><?php echo $search_order_name; ?></option>
												<option value="rating" <?php echo (isset($options['search_order']) && $options['search_order'] == 'rating') ? 'selected="selected"' : "" ;?>><?php echo $search_order_rating; ?></option>
												<option value="relevance" <?php echo (isset($options['search_order']) && $options['search_order'] == 'relevance') ? 'selected="selected"' : "" ;?>><?php echo $search_order_relevance; ?></option>
											</select>
                    </div>
                    <div class="col-sm-6">
											<select name="search_suggestion_options[search_order_dir]" id="input-search-order-dir" class="form-control">
												<option value="asc" <?php echo (isset($options['search_order_dir']) && $options['search_order_dir'] == 'asc') ? 'selected="selected"' : "" ;?>><?php echo $search_order_dir_asc; ?></option>
												<option value="desc" <?php echo (isset($options['search_order_dir']) && $options['search_order_dir'] == 'desc') ? 'selected="selected"' : "" ;?>><?php echo $search_order_dir_desc; ?></option>
											</select>              
                    </div>
                  </div>
								</div>
							</div>          

							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-search-limit"><?php echo $search_limit; ?></label>
								<div class="col-sm-10">
									<input type="text" name="search_suggestion_options[search_limit]" value="<?php echo isset($options['search_limit']) ? $options['search_limit'] : 0;?>"  id="input-search-limit" class="form-control">
								</div>
							</div>          
                        
                                  
							<input type="hidden" name="search_suggestion_module[0][search_suggestion]" value="1"/>
              
            </div>
						<div class="tab-pane" id="tab-where">        

							<table id="where" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<td class="text-center">
											<input type="checkbox" onclick="$('input[type=checkbox][name*=\'search_suggestion_options[search_where]\']').prop('checked', this.checked);" />
										</td>
										<td class="text-left"><?php echo $search_where; ?></td>  
									</tr>
								</thead>
								<tbody >
									<tr>
										<td class="text-center">
											<input type="checkbox" name="search_suggestion_options[search_where][name]" value="1" <?php echo (isset($options['search_where']['name']) && $options['search_where']['name']) ? "checked=checked" : "" ;?> />
										</td>
										<td class="text-left"><?php echo $search_where_name; ?></td>  
									</tr>

								</tbody>
							</table>
							<?php echo $tab_where_help; ?>  

            </div>
						<div class="tab-pane" id="tab-fields">
          
              <table id="fields" class="table table-striped table-bordered table-hover sorted_table">
                <thead>
                  <tr>
                    <td class="left"><?php echo $search_fields_show; ?></td>
                    <td class="left"><?php echo $search_fields; ?></td>              
                    <td class="left"><?php echo $search_fields_show_field_name; ?></td>  
                    <td class="left"><?php echo $search_fields_location; ?></td>  
                    <td class="left"><?php echo $search_fields_sort; ?></td>  
                  </tr>
                </thead>
                <tbody>

                  <?php foreach ($options['search_field'] as $field_name => $field_options) { ?>
                    <?php if ($field_name == 'name' || $field_name == 'price') { ?>
                    <tr>
                      <td width="1" style="text-align: center;">
                        <input type="checkbox" name="search_suggestion_options[search_field][<?php echo $field_name ?>][show]" value="1" <?php echo (isset($field_options['show']) && $field_options['show']) ? "checked=checked" : "" ;?> class="form-control"/>
                      </td>
                      <td class="left"><?php echo ${'search_field_' . $field_name}; ?></td>              
                      <td class="left">
                        <input type="checkbox" name="search_suggestion_options[search_field][<?php echo $field_name ?>][show_field_name]" value="1" <?php echo (isset($field_options['show_field_name']) && $field_options['show_field_name']) ? "checked=checked" : "" ;?> class="form-control"/>
                      </td>
                      
                      <td class="left">
                        <select name="search_suggestion_options[search_field][<?php echo $field_name ?>][location]" class="form-control">
                          <option value="newline" <?php echo (isset($field_options['location']) && $field_options['location'] == 'newline') ? "selected='selected'" : "" ;?>>
                            <?php echo $search_field_location_newline; ?>
                          </option>            
                          <option value="inline" <?php echo (isset($field_options['location']) && $field_options['location'] == 'inline') ? "selected='selected'" : "" ;?>>
                            <?php echo $search_field_location_inline; ?>
                          </option>
                        </select>  
                      </td>  
                      <td class="left">
                        <input type="text" name="search_suggestion_options[search_field][<?php echo $field_name ?>][sort]" value="<?php echo isset($field_options['sort']) ? (int)$field_options['sort'] : 0; ?>" size="3" class="form-control"/>
                      </td>  
                      
                    </tr>
                    
                    <?php } else { ?>
                    
                    
                    <?php } ?>            
                  <?php } ?>

                </tbody>
              </table>  
							
            </div>
			</div>
        </form>
      </div>
    </div>
  </div>
	<div id="copyright"></div>
  
  <style type="text/css">
    .sorted_table tbody tr {
      cursor: move;
    }
  </style>
  
	<script type="text/javascript"><!--
	
		$(document).ready(function() {
    
      // Sortable rows
      $('.sorted_table tbody').sortable({
        cursor: 'move',
        update: function( event, ui ) {
          ui.item.parent().find('tr').each(function (i, row) {
            $(row).find('input[name*="[sort]"]').val(i);
          });
        }
      });
			
      // Hide attributes
			if ($('input[name=\'search_suggestion_options[search_field][attributes][show]\']').is(':not(:checked)')) {
				$('#fields_attributes').hide();
			}
		});
    
		$('input[name=\'search_suggestion_options[search_field][attributes][show]\']').on('change', function() {
			if ($(this).is(':checked')) {
				$('#fields_attributes').show();
			}
			else {
				$('#fields_attributes').hide();
			}
		});

	//--></script> 
</div>
<?php echo $footer; ?>
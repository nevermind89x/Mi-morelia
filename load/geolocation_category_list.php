<?php
$section = 'categories';
$section_id = 25;
$sub = 'listGcategory';

$typeOfUser = (fAuthorization::checkAuthLevel('super'));
$where = "";
if (!$typeOfUser) $where = " WHERE " . fSession::get('where_at');
?>
	
<?php
$limit = fRequest::encode('limit','integer');
$page = fRequest::encode('p','integer');

if($page < 1) exit();
$start = ($page - 1) * $limit;

$categories = fRecordSet::buildFromSQL(
	'EconomicUnitCategory',
	"SELECT * FROM economic_unit_categories $where LIMIT $start,$limit",
	"SELECT count(*) FROM economic_unit_categories $where",
	$limit, // $limit
	$page  // $page
);	

if($categories->count() == 0) { 
echo '<div class="notification information" >
		Por el momento no hay registros en <b> Categor&iacute;as de Geolocalización</b>.
		</div>';
} else {

$p = new Pagination($categories->getPages(),$categories->getPage(),3);
$pagination = $p->getPaginationLinks();
?>
<center>
<table class="contenttoc" style="width:auto; float:left">
				<tr>
					<th> <input type="checkbox" name="check" id="check" /> </th>
					<th> Nombre </th>
					<th> Editar </th>
					<th> Eliminar </th>
				</tr>
				
				<?php
				date_default_timezone_set('America/Mexico_City');
				
					
					

					foreach ($categories as $ecategory) {
					
					
					$id = $ecategory->prepareEconomicUnitCategoryId();

						
						
						echo '<tr>
								<td> <input type="checkbox" class="check" value="' . $id . '" name="args[]" /> </td>
						';
						
						echo '
								<td> ' . $ecategory->prepareEconomicUnitCategoryName() . ' </td>
						';
						
						
						
						echo	'<td><center><a href="edit.php?id='.$id.'&s=25"><img src="' . ICON . 'edit.png" /></a> </center></td>
								<td><center><a id="'.$id.'" class="eliminar" href="javascript:deleteIt(' . $id . ')"><img src="' . ICON . 'delete.png" /> </a> </center> </td>
							</tr>
						';
					
					}
					
				?>
				
				
				
				</table>
<br style="clear:both;" />
<div class="pagination">
	<?php echo $pagination ?>
</div>
</center>
<?php } ?>
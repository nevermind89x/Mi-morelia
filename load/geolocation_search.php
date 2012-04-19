<?php
/* if (fAuthorization::checkAuthLevel('super') && fAuthorization::checkAuthLevel('admin')) 
	header("Location: " . SITE);
	*/
/*
$typeOfUser = (fAuthorization::checkAuthLevel('admin') || fAuthorization::checkAuthLevel('super'));
$where = "";
if (!$typeOfUser) $where = " WHERE id_user = $idUser";
*/



$canEdit = fAuthorization::checkACL('geolocation', 'edit');
$canDelete = fAuthorization::checkACL('geolocation', 'delete');

fSession::open();
$idUser = fSession::get(SESSION_ID_USER);
if(empty($idUser) || (!fAuthorization::checkACL("geolocation", "delete") && !fAuthorization::checkACL("geolocation", "edit"))) {
	//header('Location: '.SITE);
	exit("No se ha podido acceder a esta secci&oacite;n");
}
$canEdit = true;
$canDelete = true;

$typeOfUser = (fAuthorization::checkAuthLevel('super'));
$where = " WHERE ";
if (!$typeOfUser) $where = " WHERE " . fSession::get('where_at') . " AND ";

?>
<?php
	$section = 'geolocation';
	$section_id = 25;
	$sub = 'list';
?>	
<?php
$query = fRequest::encode('query','string');
$limit = fRequest::encode('limit','integer');
$page = fRequest::encode('p','integer');
if($page < 1) exit();
$start = ($page - 1) * $limit;

$av = fRecordSet::buildFromSQL(
	'EconomicUnit',
	"SELECT * FROM economic_units $where ( economic_unit_name LIKE '%$query%' OR economic_unit_street_type LIKE '%$query%' OR economic_unit_street_name LIKE '%$query%' OR economic_unit_phone LIKE '%$query%' OR economic_unit_region IN (SELECT id_region FROM region WHERE name LIKE '%$query%')) LIMIT $start,$limit",
	"SELECT count(*) FROM economic_units $where ( economic_unit_name LIKE '%$query%' OR economic_unit_street_type LIKE '%$query%' OR economic_unit_street_name LIKE '%$query%' OR economic_unit_phone LIKE '%$query%' OR economic_unit_region IN (SELECT id_region FROM region WHERE name LIKE '%$query%'))",
	$limit, // $limit
	$page  // $page
);

if($av->count() == 0) { 
echo '<div class="notification information" >
								Por el momento no hay registros en <b> Observatorio </b>.
							</div>';
} else {

$p = new Pagination($av->getPages(), $av->getPage(),3);
$pagination = $p->getPaginationLinks();
?>


<center>
<table class="contenttoc" style="width:auto; float:none">
	<tr>
		<th> <input type="checkbox" name="check" id="check" /> </th>
		<th> Nombre </th>
		<th> Tipo de Vialidad </th>
		<th> Descripci&oacute;n </th>
		<th> Calle </th>
		<th> N&uacute;mero </th>
		<th> Tel&eacute;fono </th>
		<th> Regi&oacute;n </th>
		<th> Activo </th>
		<th> Verificado </th>
	<?php if($canEdit): ?> <th> Editar </th> <?php endif; ?>
	<?php if($canDelete): ?> <th> Eliminar </th> <?php endif; ?>
	</tr>
	<?php
	// $user = new User();
	// $users = $user->getAll();
	foreach($av as $a): 
	
		$id = $a->prepareEconomic_unit_id();
		
		
		echo '<tr><td> <input type="checkbox" class="check" value="' . $id . '" name="args[]" /> </td>';
						
		echo '<td> ' . $a->prepareEconomic_unit_name() . ' </td>';
		echo '<td> ' . $a->prepareEconomic_unit_street_type() . ' </td>';
		echo '
			<td> ' . substr($a->prepareEconomic_unit_description(),0,30) . ' </td>
		';
		echo '<td> ' . $a->prepareEconomic_unit_street_name() . ' </td>';
echo '<td> ' . $a->prepareEconomic_unit_location_number	() . ' </td>';		
		echo '<td> ' . $a->prepareEconomic_unit_phone() . ' </td>';		
		echo '<td>';	
			$idRegion = $a->prepareEconomic_unit_region();
			if (!empty($idRegion)):
			try {
				$region = new Region($idRegion);
				echo $region->prepareName();
			} catch(Exception $e){
				echo "Sin regi&oacute;n";
			}
			endif;
						
		echo '</td>';
		
				$status = $a->getActive();
		$status = ($status == true || $status == "Yes" || $status == 1) ? "Activo" : "Inactivo";
		
		echo '<td> '. $status . "</td>";
				$status = $a->getVerified();
		$status = ($status == true || $status == "Yes" || $status == 1) ? "Verificado" : "No verificado";
		
		echo '<td> '. $status . "</td>";
		if($canEdit)
		echo '<td><center><a href="edit.php?id='.$id.'"><img src="' . ICON . 'edit.png" /></a> </center></td>';
		if($canDelete)
		echo '<td><center><a id="'.$id.'" class="eliminar" href="javascript:deleteIt(' . $id . ')"><img src="' . ICON . 'delete.png" /> </a> </center> </td>';
		
		echo '</tr>';
			
	endforeach;
	?>
	
</table>

<div class="pagination">
	<?php echo $pagination ?>
</div>

</center>
<?php } ?>
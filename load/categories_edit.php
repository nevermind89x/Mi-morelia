<?php
$id = fRequest::encode('id','integer');
$s = fRequest::encode('id_section','integer');


	
	
try {
 if ($s != 2) {
	$category = new Category(array("id_section" => $s, "id_category" => $id));
	$category->setName(fRequest::encode('name','string'));
} else {
	$category = new EconomicUnitCategory($id);
	$category->setEconomicUnitCategoryName(fRequest::encode('name','string'));
}		

} catch (Exception $e) {} 

 
try { $category->store();
} catch (Exception $e){
					exit ("Ha ocurrido un error.");
				}

exit("1");
?>
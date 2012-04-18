<?php
$s = fRequest::encode('id_section','integer');
if ($s != 2) {
$category = new Category();
 
$parent_id = fRequest::encode('parent_id','integer');

if($parent_id != 0) {
	$category->setId_parent($parent_id);
} else {
	$category->setId_parent(0);
}
 
 $category->setId_section(fRequest::encode('id_section','integer'));
 $category->setName(fRequest::encode('name','string'));

 
try { $category->store(); } catch (Exception $e){
					exit ("Ha ocurrido un error.");
				}
} else {
	$category = new EconomicUnitCategory();
	$category->setEconomicUnitCategoryName(fRequest::encode('name','string'));
	$category->setEconomicUnitCategoryOriginalId(0);
	try { $category->store(); } catch (Exception $e){
		die($e->getMessage());
	}
}				
exit("1");
?>
<?php
fSession::open();
			$idUser = fSession::get(SESSION_ID_USER);
			if(empty($idUser) || !fAuthorization::checkACL('news', 'delete')) {
				header('Location: '.SITE);
				exit("No se ha podido acceder a esta secci&oacite;n");
			}
			
$id = fRequest::encode('id','string');
				if(strstr($id, ",")) {
					fORMDatabase::retrieve()->query("DELETE FROM economic_units WHERE economic_unit_id IN ($id)");
				} else {
				
					$author = new EconomicUnit($id);
					$author->delete();
					
				}
				fORMDatabase::retrieve()->query("DELETE FROM economic_units_has_economic_unit_categories WHERE economic_units_economic_unit_id IN ($id)");
?>
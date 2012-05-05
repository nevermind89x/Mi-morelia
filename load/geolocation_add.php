<?php
		fSession::open();
			$idUser = fSession::get(SESSION_ID_USER);
			if(empty($idUser) || !fAuthorization::checkACL('geolocation', 'add')) {
				header('Location: '.SITE);
				exit("No se ha podido acceder a esta secci&oacite;n");
			}
	$av = new EconomicUnit();
	$av->setEconomicUnitName(fRequest::encode('title','string'));
	//$av->setCreatedAt(date('Y-m-d H:m:s'));
	$av->setEconomicUnitStreetType(fRequest::encode('type','string'));
	$av->setEconomicUnitLatitude(fRequest::encode('latitude','string'));
	$av->setEconomicUnitLongitude(fRequest::encode('longitude','string'));
	$av->setEconomicUnitDescription(fRequest::encode('description','string'));
	$av->setEconomicUnitStreetName(fRequest::encode('street','string'));
	$av->setEconomicUnitLocationNumber(fRequest::encode('number','string'));
	$av->setEconomicUnitReserve(fRequest::encode('reserve','string'));
	$av->setEconomicUnitPhone(fRequest::encode('phone','string'));
		$av->setEconomicUnitCellphone(fRequest::encode('cellphone','string'));
	$av->setEconomicUnitEmail(fRequest::encode('email','string'));
	$av->setEconomicUnitCreditCard(fRequest::encode('credit_card','string'));
	$av->setEconomicUnitFacebookPage(fRequest::encode('fb','string'));
	$av->setEconomicUnitTwitter(fRequest::encode('tw','string'));
	$av->setActive(fRequest::encode('status','integer'));
	$av->setVerified(fRequest::encode('verified','integer'));
	
	try { $av->store(); 	
		$lastId = fORMDatabase::retrieve()->getLastId(); 
	} catch (Exception $e){
		exit ("Ha ocurrido un error." .$e->getMessage());
	}
				
	$id_cat = fRequest::encode('cat', 'array');
	$total_cat = count($id_cat);
	
				for($i = 0; $i < $total_cat; $i++){
					$ts = new EconomicUnitHasCategory();
				
					$ts->setEconomic_units_economic_unit_id($lastId);
					$ts->setEconomic_unit_categories_economic_unit_category_id($id_cat[$i]);
					$ts->store();
				}
				
				
	
				
				/* Add Videos From External Server */

				$videos = fRequest::encode('video');
				$descrip = fRequest::encode('descrip2');
				
				 
				
				if(!empty($videos[0])){
					$count = count($videos);
					$statement = fORMDatabase::retrieve()->prepare("INSERT INTO resource (id_entity,id_section,token,url,resource_type,description) VALUES (%i, 2, '', %s, 'e', %s)");
					
					for($i = 0; $i < $count; $i++){
						  if($descrip[$i] == "Si es necesario escribe la descripci&oacute;n del video") $descrip[$i] = "";
						fORMDatabase::retrieve()->query($statement, $lastId, $videos[$i], $descrip[$i]); 
					}
				}
				
	/*
				 * Add Files to Server
				 */
				if (!empty($_FILES)) {
				$uploader = new fUpload();
				$uploader->setOptional();
				$uploader->setMIMETypes(
					$acceptedFiles,
					'El tipo de archivo es incorrecto'
				);
				
				
				
				
				$dir = 'uploads/geolocation/';
				$dir2 = 'uploads/geolocation/thumbs/';
				
				$imageDescrip = fRequest::encode('imageDescrip');
				
				
				
				$uploaded = fUpload::count('files');
				for ($i=0; $i < $uploaded; $i++) {
						$ext = strtolower(pathinfo($_FILES['files']['name'][$i], PATHINFO_EXTENSION));
						$_FILES['files']['name'][$i] = fURL::makeFriendly(str_replace(' ','-',$_FILES['files']['name'][$i])).".$ext";
						$uploader->move($dir, 'files', $i);
						$fileName[] = $_FILES['files']['name'][$i];
						$fileType[] = $_FILES['files']['type'][$i];
						
						copy($dir . $fileName[$i],$dir2 . $fileName[$i]);
						$image3 = new fImage($dir2 . $fileName[$i]);
						$image3->cropToRatio(1, 1, 'left', 'bottom');
						$image3->resize(200,0);
						$image3->saveChanges();
					
					}
								
					/*
					 * Add Files to DataBase (Resource)
					*/
				 
					try {
						$statement = fORMDatabase::retrieve()->prepare("INSERT INTO resource (id_entity,id_section,token,url,resource_type,description) VALUES (%i, 2, '', %s, %s, %s)");
						for ($i=0; $i < $uploaded; $i++) { 
						  if($imageDescrip[$i] == "Si es necesario escribe la descripci&oacute;n del archivo") $imageDescrip[$i] = "";
						fORMDatabase::retrieve()->query($statement, $lastId, $fileName[$i], Util::getResourceType($fileType[$i]), $imageDescrip[$i]); 
						}
					} catch (fSQLException $e){
						die("No se ha podido ejecutar la consulta");
					}
				}			
				
	exit("1");
?>
<?php
		fSession::open();
			$idUser = fSession::get(SESSION_ID_USER);
			if(empty($idUser) || !fAuthorization::checkACL('geolocation', 'edit')) {
				exit("No se ha podido acceder a esta secci&oacite;n");
			}
	$id = fRequest::encode('id','integer');
	if(empty($id)) exit("Ha ocurrido un error");
	if(!fAuthorization::checkAuthLevel('super')) {
				$isOwner = fRecordSet::build('EconomicUnit', array('economic_unit_id =' => $id, 'economic_unit_region='=>fSession::get('regs')));
				$count = $isxOwner->count() > 0;
			
				if(!$count) 
					header('Location: '.SITE);
			}
			
try {
			$av = new EconomicUnit($id);
	} catch(Exception $e) { header("Location: " . SITE); }
	
	
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
	$av->setActive(fRequest::encode('status','integer'));
	$av->setVerified(fRequest::encode('verified','integer'));
	
	try { $av->store(); 	
	
	} catch (Exception $e){
		exit ("Ha ocurrido un error." .$e->getMessage());
	}
				
	$id_cat = fRequest::encode('cat', 'array');
	$total_cat = count($id_cat);

	fORMDatabase::retrieve()->query("DELETE FROM economic_units_has_economic_unit_categories  WHERE economic_units_economic_unit_id = $id");
	
				for($i = 0; $i < $total_cat; $i++){
					$ts = new EconomicUnitHasCategory();
				
					$ts->setEconomic_units_economic_unit_id($id);
					$ts->setEconomic_unit_categories_economic_unit_category_id($id_cat[$i]);
					$ts->store();
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
						/*
				    $ftp = new ftp($user,$pass);
					$ftp->upload($dir . "/" . $fileName[$i], 'DIR EN REMOTE');
					# resize 
					$ftp->upload($dir2 . "/" . $fileName[$i], 'DIR EN REMOTE');
					$image->delete
					*/
					
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
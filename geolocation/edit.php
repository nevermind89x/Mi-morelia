<?php
require_once '../init.php';
$section = 'geolocation';
$sub = 'edit';

fSession::open();
			$idUser = fSession::get(SESSION_ID_USER);
			if(empty($idUser) || !fAuthorization::checkACL($section, "edit")) {
				header('Location: '.SITE);
				exit("No se ha podido acceder a esta secci&oacite;n");
			}
			
	$id = fRequest::encode('id','integer');
if(empty($id)) header("Location: " . SITE);

if(!fAuthorization::checkAuthLevel('super')) {
				$isOwner = fRecordSet::build('EconomicUnit', array('economic_unit_id =' => $id));
				$count = $isxOwner->count() > 0;
			
				if(!$count) 
					header('Location: '.SITE);
			}
			
try {
			$e = new EconomicUnit($id);
	} catch(Exception $e) { header("Location: " . SITE); }
require_once INCLUDES.'header.php';
?>


			<link rel="stylesheet" href="<?php echo CSS ?>ui-lightness/jquery-ui-1.8.16.custom.css" type="text/css" />
			<link rel="stylesheet" href="<?php echo JS ?>jwysiwyg/jquery.wysiwyg.css" type="text/css" />
			<link rel="stylesheet" href="<?php echo CSS ?>multiselect.css" type="text/css" />
			<script type="text/javascript" src="<?php echo JS ?>jwysiwyg/jquery.wysiwyg.js"></script>
			
			<script type="text/javascript" src="<?php echo JS ?>jquery.form.js"></script>
			<script type="text/javascript" src="<?php echo JS ?>jquery-ui-1.8.16.custom.min.js"></script>
			<script type="text/javascript" src="<?php echo JS ?>jquery.ui.core.min.js"></script>
	
			
			<script type="text/javascript" src="<?php echo JS ?>ui.multiselect.js"></script>
			<script src="<?php echo JS ?>jquery.validate.min.js"></script>
			<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
			<script type="text/javascript" src="<?php echo SCRIPT . $section . "/" . "edit"; ?>.js"></script>

			<script type="text/javascript">
				$(document).ready(function() {
					$(".wysiwyg").wysiwyg();
					initialize();
					//codeAddress();
					$(".multiselect").multiselect();
				});
				var infowindow = new google.maps.InfoWindow({ 
					disableAutoPan:false,
					size: new google.maps.Size(100,50)
				});

				function successCallback(position) {
					lat = position.coords.latitude;
					lon = position.coords.longitude;
				}

				function errorCallback(error) {
					dump(error);
				}

				function dump(obj) {
					var out = '';
					for (var i in obj)
						out += i + ": " + obj[i] + "\n";
					alert(out);
				}

				// A function to create the marker and set up the event window function 
				function createMarker(latlng, name, html) {
					var contentString = html;
					var marker = new google.maps.Marker({
						position: latlng,
						map: map,
						zIndex: Math.round(latlng.lat()*-100000)<<5
					});

					google.maps.event.addListener(marker, 'click', function() {
						infowindow.setContent(contentString); 
						infowindow.open(map,marker);
					});
					google.maps.event.trigger(marker, 'click');    
					$("#lat").val(lat);
					$("#lon").val(lon);
					return marker;
				}
				function codeAddress() { 
					var address = $("#address").val() + ", " + document.getElementById("city_i").value + ", " + $("#state option:selected").html() + ", " + $("#country option:selected").html();
					if (geocoder) {
						geocoder.geocode( { 'address': address}, function(results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								map.setCenter(results[0].geometry.location);
							} else {
								alert("Geocode was not successful for the following reason: " + status);
							}
						});
					}
				}

				function initialize() {
					geocoder = new google.maps.Geocoder();
					var latlng = new google.maps.LatLng(<?php echo $e->prepareEconomicUnitLatitude() ?>,<?php echo $e->prepareEconomicUnitLongitude() ?>);
					var myOptions = {
						zoom: 16,
						center: latlng,
						mapTypeControl: true,
						mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
						navigationControl: true,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
					x = latlng.toString();
					x = x.split(",");
					lat = <?php echo $e->prepareEconomicUnitLatitude() ?>;
					lon = <?php echo $e->prepareEconomicUnitLongitude() ?>;
					map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
					google.maps.event.addListener(map, 'click', function() {
						infowindow.close();
					});
					
					google.maps.event.addListener(map, 'click', function(event) {
						//call function to create marker
						if(marker) {
							marker.setMap(null);
							marker = null;
						}
						marker = createMarker(event.latLng, "name",'Mi negocio');
						lat = event.latLng.lat();
						lon = event.latLng.lng();
					});

					var latlng = new google.maps.LatLng(lat,lon);
					marker =  new google.maps.Marker({
						position: latlng,
						map: map,
						zIndex: Math.round(latlng.lat()*-100000)<<5
					});
					infowindow.setContent('Mi negocio'); 
					infowindow.open(map,marker);
				}
			</script>
			<style>
			
			</style>
			
			
			
			<!-- MAIN CONTAINER -->
			<div id="ja-container" class="wrap ja-r2">
				<div class="main clearfix"><div class="notification success" style="display:none;" >
								Se ha agregado exitosamente. 
							</div>
							<div class="notification errorBox" style="display:none;" >
								Ha ocurrido un error, revise la informaci&oacute;n. 
							</div>
							<br/>
					<form action="../do.php" method="post" id="add">
							<input type="hidden" name="latitude" id="lat" value="<?php echo $e->prepareEconomicUnitLatitude() ?>" />
						<input type="hidden" name="longitude" id="lon" value="<?php echo $e->prepareEconomicUnitLongitude() ?>" />
						<input type="hidden" name="request_token" value="<?php echo fRequest::generateCSRFToken(SITE . "do.php") ?>" />
						<input type="hidden" name="id" value="<?php echo $id ?>" />
						<input type="hidden" name="whatToDo" value="geolocation_edit" />
						
						<table  class="contenttoc" style="float:left">
						
						
						<tr>
								<td><label> Nombre </label></td>
								<td><input type="text" name="title" value="<?php echo $e->prepareEconomicUnitName() ?>" size="80" /></td>
								
						
							</tr>
							<tr>
								<td> <label for="type"> Tipo de Vialidad: </label> </td>
								<td> <input type="text" size="80" name="type" value="<?php echo $e->prepareEconomicUnitStreetType() ?>" id="type" /> </td>
							</tr>
							
							<tr>
								<td> <label for="text"> Descripci&oacute;n: </label> </td>
								<td> <textarea cols="80" rows="10" name="description" id="description" class="wysiwyg"><?php echo $e->prepareEconomicUnitDescription() ?></textarea> </td>
							</tr>
							
							<tr>
								<td> <label for="street"> Calle: </label> </td>
								<td> <input type="text" size="80" name="street" value="<?php echo $e->prepareEconomicUnitStreetName() ?>"  id="street" /> </td>
							</tr>
							
							<tr>
								<td> <label for="number"> N&uacute;mero: </label> </td>
								<td> <input type="text" size="10" name="number" id="number" value="<?php echo $e->prepareEconomicUnitLocationNumber() ?>"  /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Asentamiento: </label> </td>
								<td> <input type="text" size="80" name="reserve" id="reserve" value="<?php echo $e->prepareEconomicUnitReserve() ?>" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Tel&eacute;fono: </label> </td>
								<td> <input type="text" size="80" name="phone" id="phone" value="<?php echo $e->prepareEconomicUnitPhone() ?>" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Celular: </label> </td>
								<td> <input type="text" size="80" name="cellphone" id="cellphone" value="<?php echo $e->prepareEconomicUnitCellphone() ?>" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Correo Electr&oacute;nico: </label> </td>
								<td> <input type="text" size="80" name="email" id="email" value="<?php echo $e->prepareEconomicUnitEmail() ?>" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Tarjeta de Cr&eacute;dito: </label> </td>
								<td> <input type="text" size="80" name="credit_card" id="credit_card" value="<?php echo $e->prepareEconomicUnitCreditCard() ?>" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> P&aacute;gina de Facebook: </label> </td>
								<td> <input type="text" size="80" name="fb" id="fb"  value="<?php echo $e->prepareEconomicUnitFacebookPage() ?>" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> P&aacute;gina de Twitter: </label> </td>
								<td> <input type="text" size="80" name="tw" id="tw" value="<?php echo $e->prepareEconomicUnitTwitter() ?>" /> </td>
							</tr>
							
								
									
				
							
									<?php
							$status = $e->getActive();
						$status = ($status == true || $status == "Yes" || $status == 1) ? "1" : "0";
						?>
						
						<tr>
							<td> <label for="status"> Estado <label> </td> 
							<td>
								<select name="status" style="width:200px"> 
								
									<option value="1" <?php if($status=="1") echo "selected='selected'"; ?> > Aceptado </option>
									<option value="0"<?php if($status=="0") echo "selected='selected'"; ?>  > Rechazado </option>
								</select>
							</td>
						</tr>
						
									<?php
							$status = $e->getVerified();
						$status = ($status == true || $status == "Yes" || $status == 1) ? "1" : "0";
						?>
						
						<tr>
							<td> <label for="verified"> Verificado <label> </td> 
							<td>
								<select name="verified" style="width:200px"> 
								
									<option value="1" <?php if($status=="1") echo "selected='selected'"; ?> > Verificado </option>
									<option value="0"<?php if($status=="0") echo "selected='selected'"; ?>  > No verificado </option>
								</select>
							</td>
						</tr>
						
							
							<tr>
						
								<td colspan="2"><input type="submit" value="Editar" class="button right" /></td>
							</tr>
						</table>
						<table style="margin-left:20px; float:left">
								<tr><td><div id="map_canvas" style="width:500px;height:300px"></div></td></tr>
									<?php
							$cat = EconomicUnitHasCategory::findForUnit($id);
							
							
							foreach($cat as $sfp){
								$subsg[] = $sfp->prepareEconomic_unit_categories_economic_unit_category_id();
							}
							
							
						?>
								<tr>
								<td>
									<label for="subgiro">
									Categor&iacute;as
									</label>
								</td>
								
								
							</tr>
							<tr>
							<td>
									<select name="cat[]" class="multiselect" style="width:500px; height:200px;" multiple="multiple">
											<?php
												$subg2 = EconomicUnitCategory::findAll();
												foreach($subg2 as $sg){
														if(in_array($sg->prepareEconomic_unit_category_id(),$subsg)) $sel = "selected=\"selected\""; else $sel = "";
													echo '<option '.$sel.' value="'.$sg->prepareEconomic_unit_category_id().'"> '.$sg->prepareEconomic_unit_category_name().'</option>' ;
												}
											?>
									</select>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
<?php require_once INCLUDES.'footer.php' ?>
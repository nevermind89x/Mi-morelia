<?php
require_once '../init.php';
$section = 'geolocation';
$sub = 'add';

fSession::open();
			$idUser = fSession::get(SESSION_ID_USER);
			if(empty($idUser) || !fAuthorization::checkACL($section, "add")) {
				header('Location: '.SITE);
				exit("No se ha podido acceder a esta secci&oacite;n");
			}
require_once INCLUDES.'header.php';
?>


			<link rel="stylesheet" href="<?php echo CSS ?>ui-lightness/jquery-ui-1.8.16.custom.css" type="text/css" />
			<link rel="stylesheet" href="<?php echo JS ?>jwysiwyg/jquery.wysiwyg.css" type="text/css" />
			<link rel="stylesheet" href="<?php echo CSS ?>multiselect.css" type="text/css" />
			<script type="text/javascript" src="<?php echo JS ?>jwysiwyg/jquery.wysiwyg.js"></script>
			<script type="text/javascript" src="<?php echo JS ?>upload/jquery.MultiFile.js"></script>
			<script type="text/javascript" src="<?php echo JS ?>jquery.form.js"></script>
			<script type="text/javascript" src="<?php echo JS ?>jquery-ui-1.8.16.custom.min.js"></script>
			<script type="text/javascript" src="<?php echo JS ?>jquery.ui.core.min.js"></script>
	
			
			<script type="text/javascript" src="<?php echo JS ?>ui.multiselect.js"></script>
			<script src="<?php echo JS ?>jquery.validate.min.js"></script>
			<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
			<script type="text/javascript" src="<?php echo SCRIPT . $section . "/" . "add"; ?>.js"></script>

			<script type="text/javascript">
				$(document).ready(function() {
				
				$("#addVideo").live("click",function(){
						$('<tr><td><label for="video"> Video </label></td><td><input type="text" name="video[]" size="80"/><br/><input type="text" class="text" size="80" name="descrip2[]" title="Si es necesario escribe la descripci&oacute;n del video" value="Si es necesario escribe la descripci&oacute;n del video"/></td></tr> ').insertAfter($("#videos"));
					});
					$('.multid').MultiFile({
						max: 20,
						STRING: {
							file: '$file <input type="text" title="Si es necesario escribe la descripci&oacute;n del archivo" value="Si es necesario escribe la descripci&oacute;n del archivo" class="text" size="80" name="descrip[]"/> ',
						}
					});
					$('.multid2').MultiFile({
						max: 20,
						STRING: {
							file: '$file <input type="text" title="Si es necesario escribe el nombre del producto" value="Si es necesario escribe el nombre del producto" class="text" size="80" name="productname[]"/><br/><input type="text" title="Si es necesario escribe la descripci&oacute;n del producto" value="Si es necesario escribe la descripci&oacute;n del producto" class="text" size="80" name="descripp[]"/> <br/> <input type="text" name="price[]" size="10" value="Precio ($)" class="text" title="Precio ($)"/><br/><br/>',
						}
					});
					
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
					var latlng = new google.maps.LatLng(19.6929761,-101.1802989999);
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
					lat = x[0].substring(1,x[0].length); 
					lon = x[1].substring(1,x[1].length-1);
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
							<input type="hidden" name="latitude" id="lat" value="0" />
						<input type="hidden" name="longitude" id="lon" value="0" />
						<input type="hidden" name="request_token" value="<?php echo fRequest::generateCSRFToken(SITE . "do.php") ?>" />
						
						<input type="hidden" name="whatToDo" value="geolocation_add" />
						
						<table  class="contenttoc" style="float:left">
						
						
						<tr>
								<td><label> Nombre </label></td>
								<td><input type="text" name="title" size="80" /></td>
								
						
							</tr>
							<tr>
								<td> <label for="type"> Tipo de Vialidad: </label> </td>
								<td> <input type="text" size="80" name="type" id="type" /> </td>
							</tr>
							
							<tr>
								<td> <label for="text"> Descripci&oacute;n: </label> </td>
								<td> <textarea cols="80" rows="10" name="description" id="description" class="wysiwyg"></textarea> </td>
							</tr>
							
							<tr>
								<td> <label for="street"> Calle: </label> </td>
								<td> <input type="text" size="80" name="street" id="street" /> </td>
							</tr>
							
							<tr>
								<td> <label for="number"> N&uacute;mero: </label> </td>
								<td> <input type="text" size="10" name="number" id="number" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Asentamiento: </label> </td>
								<td> <input type="text" size="80" name="reserve" id="reserve" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Tel&eacute;fono: </label> </td>
								<td> <input type="text" size="80" name="phone" id="phone" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Celular: </label> </td>
								<td> <input type="text" size="80" name="cellphone" id="cellphone" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Correo Electr&oacute;nico: </label> </td>
								<td> <input type="text" size="80" name="email" id="email" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> Tarjeta de Cr&eacute;dito: </label> </td>
								<td> <input type="text" size="80" name="credit_card" id="credit_card" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> P&aacute;gina de Facebook: </label> </td>
								<td> <input type="text" size="80" name="fb" id="fb" /> </td>
							</tr>
							
							<tr>
								<td> <label for="type"> P&aacute;gina de Twitter: </label> </td>
								<td> <input type="text" size="80" name="tw" id="tw" /> </td>
							</tr>	
									
							
				<tr id="videos">
							<td><label for="video">Video(Link youtube, vimeo, etc)</label></td>
							<td> <input type="text" name="video[]" size="80"/> <br/> <input type="text" class="text" size="80" name="descrip2[]" title="Si es necesario escribe la descripci&oacute;n del video" value="Si es necesario escribe la descripci&oacute;n del video"/><a href="javascript:" id="addVideo" ><img  style="vertical-align:middle; margin-bottom:5px;" src="<?php echo ICON ?>add.png" /> </a></td>
						</tr>
							
						<tr>
						 <td><label for="images">Archivos</label></td>
						 <td><input type="file" class="multid" name="files[]"/></td>
						</tr>
							
						<tr>
							<td> <label for="status"> Estado <label> </td> 
							<td>
								<select name="status" style="width:200px"> 
									<option value="1"> Aceptado </option>
									<option value="0"> Rechazado </option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td> <label for="verified"> Verificado <label> </td> 
							<td>
								<select name="verified" style="width:200px"> 
									<option value="1"> Verificado </option>
									<option value="0"> No verificado </option>
								</select>
							</td>
						</tr>
						<tr>
							<td> <label for="logo"> Logo <label> </td> 
							<td>
								<input type="file" name="logo" style="width:200px" /> 
							</td>
						</tr>
							
							<tr>
						
								<td colspan="2"><input type="submit" value="Agregar" class="button right" /></td>
							</tr>
						</table>
						<table style="margin-left:20px; float:left">
								<tr><td><div id="map_canvas" style="width:500px;height:300px"></div></td></tr>
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
												$subg = EconomicUnitCategory::findAll();
												foreach($subg as $sg){
													echo '<option value="'.$sg->prepareEconomic_unit_category_id().'"> '.$sg->prepareEconomic_unit_category_name().'</option>' ;
												}
											?>
									</select>
								</td>
							</tr>
							<tr>
							<td style="padding-left:100px;">
							<input type="radio" name="typeps" value="1" /> Producto &nbsp;<input type="radio" name="typeps" value="0"/> Servicio
							</td>
							</tr>
						</table>
						
						<table class="contenttoc" style="float:left; margin-left:35px;">
							
							<tr><td>
								<td><label for="images">Productos</label></td>
								<td><input type="file" class="multid2" name="files2[]"/></td>
							</td></tr>
						</table>
					</form>
				</div>
			</div>
<?php require_once INCLUDES.'footer.php' ?>
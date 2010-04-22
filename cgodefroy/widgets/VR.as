/** Created on 5/9/29 by cgodefroy
(c) Navidis 2005 **/

/* Flash VR
Permet de créer un VR-like à partir d'un panoramique circulaire. Ce panoramique dispose de hotspots. lorsque la souris se trouve à l'intérieur d'un hotspot, l'information est renvoyée à un observer qui dispatche l'info aux objets qui se sont abonnés. On peut fournir un curseur spécifique pour quand on est dans un hotspot et un autre pour quand on est dans l'image.
Le VR dispose aussi d'un zoom qui peut être bloqué sur des valeurs min/max. 
 */

class navidis.widgets.VR{
	// L'url de l'image à utiliser comme pano
	private var imageUrl:String;
	// La liste des hotspots
	private var hotspots:Array;
	
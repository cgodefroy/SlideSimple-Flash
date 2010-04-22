/** Created on 5/9/29 by cgodefroy
(c) Navidis 2005 **/

/* Flash VR
Permet de cr�er un VR-like � partir d'un panoramique circulaire. Ce panoramique dispose de hotspots. lorsque la souris se trouve � l'int�rieur d'un hotspot, l'information est renvoy�e � un observer qui dispatche l'info aux objets qui se sont abonn�s. On peut fournir un curseur sp�cifique pour quand on est dans un hotspot et un autre pour quand on est dans l'image.
Le VR dispose aussi d'un zoom qui peut �tre bloqu� sur des valeurs min/max. 
 */

class navidis.widgets.VR{
	// L'url de l'image � utiliser comme pano
	private var imageUrl:String;
	// La liste des hotspots
	private var hotspots:Array;
	
/** Created on 5/9/28 by cgodefroy
(c) eCOMPOSITE 2005 **/


class cgodefroy.beans.DiapoWithPreview extends Diapo{
	private var previewUrl : String;
		
	public function setPreviewUrl(s:String):Void{
		previewUrl = s;
	}
	
	public function getPreviewUrl():String{
		return previewUrl;
	}
}
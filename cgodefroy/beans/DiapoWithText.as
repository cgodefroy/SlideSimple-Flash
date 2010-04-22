/** Created on 5/9/28 by cgodefroy
(c) eCOMPOSITE 2005 **/

import cgodefroy.beans.Diapo;

class cgodefroy.beans.DiapoWithText extends Diapo{
	private var title : String;
	private var description: String;
	private var destination: String;
	private var target : String;
		
	public function setTitle(s:String):Void{
		title = s;
	}
	
	public function getTitle():String{
		return title;
	}
	
	public function setDescription(s:String):Void{
		description = s;
	}
	
	public function getDescription():String{
		return description;
	}
	
	public function hasTitle():Boolean{
		if(getTitle()!=undefined && getTitle!="") return true;
		return false;
	}
	
	public function hasDescription():Boolean{
		if(getDescription()!=undefined && getDescription()!="") return true;
		return false;
	}
	
	public function setDestination(s:String):Void{
		destination = s;
	}
	
	public function getDestination():String{
		return destination;
	}
	
	public function setTarget(s:String):Void{
		target = s;
	}
	
	public function getTarget():String{
		return target;
	}
	
}
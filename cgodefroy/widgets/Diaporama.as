/** Created on 5/9/28 by cgodefroy
(c) eCOMPOSITE 2005 **/

/* Classe de diaporama qui affiche alternativement deux images à un point calé soit aux centre soit en haut à gauche avec fondu par transition alpha. Ordre aléatoire ou séquentiel. */

class cgodefroy.widgets.Diaporama{
	// array des diapos à utiliser
	private var diapoList:Array;
	// index courant dans la liste des diapos
	private var index:Number=0;
	// ordre séquentiel ou aléatoire valeurs sequential ou random
	private var order:String="sequential";
	// Image 1 ou 2
	private var i:Number=1;
	// mc qui fait office de preloader
	private var watcher_mc:MovieClip;
	// mc appellant
	private var container_mc:MovieClip;
	// intervalle de transition pour le fondu en 100/s
	private var fadeTime:Number = 10;
	// intervalle entre chaque diapo en 1000/s
	private var diapoInterval:Number=5000;
	private var watcher, loader1, loader2;
	// largeur et hauteur  max d'affichage des diapos
	private var maxWidth:Number;
	private var maxHeight:Number;
	//Intervalle de rappel de la méthode loadNext
	public var timerInterval;
	// Flag on scale les images
	public var scale:Boolean=true;
	// Flag de loop
	public var loop:Boolean=true;
	
	public function Diaporama(mc:MovieClip, maxwidth:Number, maxheight:Number){
		mc.createEmptyMovieClip("watcher_mc",mc.getNextHighestDepth());
		watcher=mc.watcher_mc;
		container_mc=mc;
		maxWidth=maxwidth;
		maxHeight=maxheight;
	}
	
	public function launch(){
		loadNext();
	}
	
	public function loadNext(){
		if (index == diapoList.length && loop) {
			index = 0;
		}
		if (!loop) {
			
		}
		loadImages();
		index++;
		clearInterval(watcher.timerInterval);
	}
	
	public function loadImages() {
		createLoader();
		if (i == 2) {
			i = 1;
		} else if (i == 1) {
			i = 2;
		}
	}
	
	public function swapPlace(clip, num) {
		eval(clip).swapDepths(eval("loader"+num));
	}
	
	public function createLoader() {
		var thisLoader:MovieClip =eval("loader"+i);
		thisLoader.removeMovieClip();
		thisLoader = container_mc.createEmptyMovieClip("loader"+i, container_mc.getNextHighestDepth());
		set("loader"+i, container_mc["loader"+i]);
		thisLoader._alpha = 0;
		thisLoader.loadMovie(diapoList[index].getImageUrl());
		thisLoader._parent.setCurrentDiapo(index);
		watcher.i=i;
		watcher.fadeTime=fadeTime;
		watcher.diapoInterval = diapoInterval;
		watcher.diapo=this;
		watcher.onEnterFrame = function() {
			var thisLoader:MovieClip = eval(this.diapo.container_mc + ".loader" + i);
			var picLoaded = thisLoader.getBytesLoaded();
			var picBytes = thisLoader.getBytesTotal();
			if (isNaN(picBytes) || picBytes<4) {
				return;
			}
			if (picLoaded/picBytes>=1) {
				var wide=false;
				if(thisLoader._width > thisLoader._height) wide=true;
				var height=thisLoader._height;
				var width=thisLoader._width;
				if(this.diapo.scale){
			thisLoader._width=(wide ? this.diapo.maxWidth : width/height*this.diapo.maxHeight);
			thisLoader._height=(wide ? height/width * this.diapo.maxWidth:this.diapo.maxHeight );
				}
				thisLoader._x = (450-thisLoader._width)/2;
				thisLoader._y = (450-thisLoader._height)/2;
				var other=1;
				if(i==1) other=2;
				var otherLoader:MovieClip = eval(this.diapo.container_mc+".loader"+other);
				thisLoader.swapDepths(otherLoader);
				thisLoader.alpha(fadeTime, 100);
				otherLoader.alpha(fadeTime, 0);
				timerInterval = setInterval(this.diapo, "loadNext", diapoInterval);
				delete this.onEnterFrame;
			}
		};
	}
		
	public function setDiapoList(list:Array){
		diapoList = list;
	}
	
	public function getDiapoList():Array {
		return diapoList;
	}
	
	public function setOrderSequential(){
		order="sequential";
	}
	
	public function setOrderRandom(){
		order="random";
		diapoList.randomize();
	}
	
	public function setFadeTime(time:Number){
		fadeTime = time;
	}
	
	public function getFadeTime():Number {
		return fadeTime;
	}
	
	public function setDiapoInterval(time:Number){
		diapoInterval = time;
	}
	
	public function getDiapoInterval():Number {
		return diapoInterval;
	}
	
	public function setScale(sc:Boolean) {
		scale=sc;
	}
	
	public function setLoop(ll:Boolean) {
		loop=ll;
	}
	
	public function setMaxHeight(aHeight:Number){
		maxHeight=aHeight;
	}
	
	public function setMaxWidth(aWidth:Number){
		maxWidth=aWidth;
	}
	
}
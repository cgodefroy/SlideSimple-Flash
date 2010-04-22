/** Fonctions prototypes bien pratiques
Created on 5/9/28 by cgodefroy
(c)  2005 */

MovieClip.prototype.alpha = function(vel, to) {
	this.vel = vel;
	this.to = to;
	this.alpha_init = this._alpha;
	this.onEnterFrame = function() {
		updateAfterEvent();
		if (this.to != undefined && this.vel != undefined) {
			if (this.to>this.alpha_init) {
				if (this._alpha<=100) {
					this._alpha += this.vel;
				} else {
					this.onEnterFrame = null;
				}
			} else {
				if (this._alpha>this.to) {
					this._alpha -= this.vel;
				} else {
					this.onEnterFrame = null;
				}
			}
		} else {
		}
	};
};

MovieClip.prototype.moveHorizontal = function(vel, to, visible) {
	this.vel = vel;
	this.to = to;
	this.y_init = this._y;
	this.onEnterFrame = function() {
		updateAfterEvent();
		if (this.to != undefined && this.vel != undefined) {
			if (this.to>this.y_init) {
				if (this._y<=this.to) {
					this._y += this.vel;
				} else {
					this._visible=visible;
					this.onEnterFrame = null;
				}
			} else {
				if (this._y>this.to) {
					this._y -= this.vel;
				} else {
					this._visible=visible;
					this.onEnterFrame = null;
				}
			}
		} else {
		}
	};
};

Array.prototype.randomize = function() {
	var i = this.length;
	if (i == 0) return;
	while (--i) {
		var j = Math.floor(Math.random()*(i+1));
		var tmp1 = this[i];
		var tmp2 = this[j];
		this[i] = tmp2;
		this[j] = tmp1;
	}
	return this;
}
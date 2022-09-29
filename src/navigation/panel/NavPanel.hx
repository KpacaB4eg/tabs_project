package navigation.panel;

import openfl.display.Sprite;

class NavPanel extends Sprite
{
	public var btnAmount:Int;
	public var spacing:Int;
	public var btnWidth:Int;	
	public var btnHeight:Int;
	
	public function new(btnAmount:Int, spacing:Int, btnWidth:Int, btnHeight:Int) {
		super();
		
		this.btnAmount = btnAmount;
		this.spacing = btnAmount;
		this.btnWidth = btnAmount;
		this.btnHeight = btnAmount;
	}
	
	public function createPanel():Sprite{
		var navPan:Sprite = new Sprite();
		navPan.graphics.beginFill(0xffffff, .9);
		navPan.graphics.drawRoundRect(0, 0, spacing + btnAmount * (btnWidth + spacing), btnHeight, 0,0);
		navPan.graphics.endFill();
		return navPan;
	}
	
}
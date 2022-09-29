package navigation.button;

import openfl.display.Sprite;
import openfl.display.SimpleButton;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldType;

class NavButton 
{
	public var btnNumber:Int;	
	public var spacing:Int;	
	public var btnWidth:Int;	
	public var btnHeight:Int;
	public var btnName:String;
  
	public function new(spacing: Null<Int>, btnWidth: Null<Int>, btnHeight: Null<Int>) {
		this.spacing = spacing != null ? spacing : 0;
		this.btnWidth = btnWidth != null ? btnWidth : 0;
		this.btnHeight = btnHeight != null ? btnHeight : 0;
	}
	
	public function createButton(buttonText: String, activeBtnName:String):SimpleButton {
		var textFormat:TextFormat = new TextFormat();
		textFormat.size = 12;
		textFormat.bold = true;
		
		var textBtnUp: TextField = createButtonText(textFormat, buttonText);
		textBtnUp.x = 0;
		textBtnUp.y = 0;	
		
		var textBtnOver: TextField = createButtonText(textFormat, buttonText);
		textBtnOver.x = 0;
		textBtnOver.y = 0;
		
		var textBtnDown: TextField = createButtonText(textFormat, buttonText);
		textBtnDown.x = 0;
		textBtnDown.y = 0;
		
		var btnUp:Sprite = new Sprite();
		btnUp.addChild(textBtnUp);
		btnSprite(btnUp, activeBtnName == btnName ? 0xfafafa : 0xa3a3a3);

		var btnOver:Sprite = new Sprite();
		btnOver.addChild(textBtnOver);
		btnSprite(btnOver, activeBtnName == btnName ? 0xfafafa : 0xc8c8c8);
		
		var btnDown:Sprite = new Sprite();
		btnDown.addChild(textBtnDown);
		btnSprite(btnDown, 0xfafafa);
		
		var btn:SimpleButton = new SimpleButton(btnUp, btnOver, btnDown, btnOver);
		btn.name = btnName;
		
		btn.useHandCursor = true;
		btn.x = spacing + btnNumber * (btnWidth + spacing);
		btn.y = 0;
		
		return btn;
	}
	
	private function btnSprite(obj: Sprite, color: Int = 0xFF0000): Void {
		obj.graphics.beginFill(color, 1);
		obj.graphics.drawRoundRect(0, 0, btnWidth, btnHeight, 0, 8);
		obj.graphics.endFill();		
	}
	
	private function createButtonText(textF:TextFormat, text: String):TextField{
		var btnText = new TextField();
		btnText.type = TextFieldType.DYNAMIC;
		btnText.mouseEnabled = false;
		btnText.text = text;
		btnText.setTextFormat(textF);
		return btnText;
	}
	
	public function getButtonName():String{
		return btnName;
	}
	
	public function setButtonName(name: String): String{
		return btnName = name;
	}
	
	public function setButtonNumber(value: Int): Int{
		return btnNumber = value;
	}
	
	public function getButtonNumber():Int {
		return btnNumber;
	}
}
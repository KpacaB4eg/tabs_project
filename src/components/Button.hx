package components;

import openfl.display.Sprite;
import openfl.display.SimpleButton;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldType;

class Button 
{
 
	public function new() {}
	
	public function createButton(buttonText: String, btnWidth: Null<Int>, btnHeight: Null<Int>, btnPosX:Null<Float>, btnPosY:Null <Float>):SimpleButton {
		var _btnPosX = btnPosX != null ? btnPosX : 0;
		var _btnPosY = btnPosY != null ? btnPosY : 0;
		var _btnWidth = btnWidth != null ? btnWidth : 0;
		var _btnHeight = btnHeight != null ? btnHeight : 0;

		
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
		btnSprite(btnUp, 0x00FFFFFF, _btnWidth, _btnHeight);

		var btnOver:Sprite = new Sprite();
		btnOver.addChild(textBtnOver);
		btnSprite(btnOver, 0x00FFFFFF, _btnWidth, _btnHeight);
		
		var btnDown:Sprite = new Sprite();
		btnDown.addChild(textBtnDown);
		btnSprite(btnDown, 0x00FFFFFF, _btnWidth, _btnHeight);
		
		var btn:SimpleButton = new SimpleButton(btnUp, btnOver, btnDown, btnOver);
		btn.name = buttonText;
		
		btn.useHandCursor = true;
		btn.x = _btnPosX;
		btn.y = _btnPosY;
		
		return btn;
	}
	
	private function btnSprite(obj: Sprite, color: Int = 0xFF0000, btnWidth:Int, btnHeight:Int): Void {
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
}
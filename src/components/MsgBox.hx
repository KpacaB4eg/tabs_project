package components;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldType;

class MsgBox 
{

	public var messageBoxName:String;
	
	public function new() 
	{
		
	}
	
	public function showMessage(text:String):Sprite{
		var messager: Sprite = new Sprite();
		
		messager.graphics.beginFill(0xfafafa, 0.9);
		messager.graphics.drawRoundRect(0, 0, 200, 50, 0, 8);
		messager.graphics.endFill();
		messager.x = 110;
		messager.y = 30;
		
		var text: TextField = createText(text);
		text.x = 0;
		text.y = 0;
		
		messager.addChild(text);
		
		return messager;
	}
	
	private function createText(text: String):TextField{
		var textFormat:TextFormat = new TextFormat();
		textFormat.size = 12;
		textFormat.bold = true;
		
		var btnText = new TextField();
		btnText.type = TextFieldType.DYNAMIC;
		btnText.mouseEnabled = false;
		btnText.text = text;
		btnText.setTextFormat(textFormat);
		return btnText;
	}
	
	public function setMessageBoxName(name:String):String{
		return this.messageBoxName = name;
	}
	
	public function getMessageBoxName():String {
		return this.messageBoxName;
	}
}
package content;

import components.Button;
import components.MsgBox;
import haxe.xml.Access;
import openfl.events.MouseEvent;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import sys.FileSystem;

class ContentRender extends Sprite
{
	public var navPanBtnHeight:Int;
	public var btnWidth:Int = 200;
	public var btnHeight:Int = 50;
	public var spacing:Int = 0;
	private var button:Button;
	private var msgBox:MsgBox;
	
	public function new(navPanBtnHeight:Int) {
		super();
		
		this.navPanBtnHeight = navPanBtnHeight;
		
		this.button = new Button();
		this.msgBox = new MsgBox();
	}
	
	public function getTabContent(tabXmlKey:String){
		var srcPath = FileSystem.fullPath('src/');
		var xmlPath = FileSystem.fullPath(srcPath.split('bin')[0] + '/src');
		var content:String = sys.io.File.getContent('${xmlPath}/xml/${tabXmlKey}.xml');
		var access = new haxe.xml.Access(Xml.parse(content));
		
		var container:Sprite = new Sprite();
		container.x = 0;
		container.y = navPanBtnHeight + 10;
		
		var i = 0;
		for (item in access.node.data.elements) {
			var btnName:String = item.node.btnName.innerData;
			var btnImage:String = item.node.btnImage.innerData;
			
			container.addChild(renderTable(btnName, btnImage, i));
			i++;
		}
		
		container.addEventListener (MouseEvent.CLICK, function (event:MouseEvent) {
			var messageBox = this.msgBox.showMessage(event.target.name);
			container.addChild(messageBox);
		});
	
		return container;
	}
	
	private function renderTable(btnName: String, btnImgSource:String, position: Int){
		var table:Sprite = new Sprite();
		var bitmap = new Bitmap (Assets.getBitmapData (btnImgSource));
		
		var paddingLeft:Int = 10;
		var paddingTop:Int = 10;
		var xPos:Float = position % 2 == 0 ? paddingLeft : paddingLeft * 2 + btnWidth;
		var yPos:Float = position % 2 == 0 ? (position / 2) * (paddingTop + btnHeight) : Math.floor((position / 2)) * (paddingTop + btnHeight);
		
		bitmap.width = btnWidth;
		bitmap.height = btnHeight;
		bitmap.x = xPos;
		bitmap.y = yPos;

		var buttonObject = this.button.createButton(btnName, btnWidth, btnHeight, xPos, yPos);

		table.addChild(bitmap);
		table.addChild(buttonObject);
		return table;
	}
	
}
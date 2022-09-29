package;

import navigation.button.NavButton;
import navigation.panel.NavPanel;
import content.ContentRender;
import openfl.events.MouseEvent;
import openfl.display.Sprite;

class Main extends Sprite 
{
	public var btnWidth:Int = 75;
	public var btnHeight:Int = 25;
	public var btnNum:Int = 3;
	public var spacing:Int = 0;
	private var activeBtnName:String = '';

	public function new() 
	{
		super();
		
		this.buttonMode = true;
		
		render();
	}
	
	private function render():Void{
		var navPan = new NavPanel(btnNum, spacing, btnWidth, btnHeight).createPanel();
		
		addChild(navPan);
		
		renderNavPanelButtons(navPan);	
	}
	
	private function renderNavPanelButtons(navPan){
		var navButton = new NavButton(spacing, btnWidth, btnHeight);
		
		var i:Int = 0;
		while (i < btnNum) {
			var btnName:String = "button_" + i;
			var tabName:String = 'Tab ${i + 1}';
			var tabXmlKey:String = 'tab_${i + 1}';
			
			navButton.setButtonNumber(i);
			navButton.setButtonName(btnName);

			var activeButtonName = getActiveButtonName();
			
			var navButtonObject;
			
			if (activeButtonName == '') {
				setActiveButtonName(btnName);
				navButtonObject = navButton.createButton(tabName, btnName);
				loadTabInfo(tabXmlKey);
			} else {
				navButtonObject = navButton.createButton(tabName, activeButtonName);
			}
			
			
			if (activeButtonName != btnName) {
				navButtonObject.addEventListener (MouseEvent.CLICK, function (event:MouseEvent) {
					setActiveButtonName(btnName);
					render();
					loadTabInfo(tabXmlKey);
				});
			}
			
			navPan.addChild(navButtonObject);

			i++;
		}
	}
	
	private function loadTabInfo(tabXmlKey:String) {
		var contentRender = new ContentRender(btnHeight);
		addChild(contentRender.getTabContent(tabXmlKey));
	}
	
	
	public function getActiveButtonName():String {
		return this.activeBtnName;
	}
	
	public function setActiveButtonName(name: String):String{
		return this.activeBtnName = name;
	}

}

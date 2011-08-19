package
{
	import com.bstack.cellmanager.CellManagerContext;
	import com.bstack.cellmanager.events.applicationState.UpdateAppHeightCommandEvent;
	import com.bstack.cellmanager.events.applicationState.UpdateAppWidthCommandEvent;
	import com.bstack.cellmanager.view.MainView;
	import com.riaspace.as3viewnavigator.IViewTransition;
	import com.riaspace.as3viewnavigator.ViewNavigator;
	import com.riaspace.as3viewnavigator.transitions.ViewNoneTransition;
	
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.Screen;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.sampler.NewObjectSample;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import flashx.textLayout.formats.TextAlign;
	
	[SWF(backgroundColor="#000000")]
	public class CellManager extends Sprite
	{
		
		// ------- Contstructor -------
		public function CellManager()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			stage.addEventListener(MouseEvent.CLICK, _traceTarget);
		}
		
		// ------- Children -------
		private var _navigator:ViewNavigator;
		
		// ------- Public Methods -------
		
		// ------- Private Properties -------
		private var _context:CellManagerContext;
		
		// ------- Private Methods -------
		private function _draw():void
		{
			graphics.beginFill(0x0F0F0F, 1);
			graphics.drawRect(0,0,640,960);
			graphics.endFill();
			
			//x
			var font:Font = new FrutigerBold();
			var titleFormat:TextFormat = new TextFormat(font.fontName, 50, 0xEFEFEF);
			titleFormat.align = TextAlign.CENTER;
			var titleField:TextField = new TextField();
			titleField.defaultTextFormat = titleFormat;
			titleField.antiAliasType = AntiAliasType.ADVANCED;
			titleField.embedFonts = true;
			titleField.text = "Cell Manager";
			titleField.width = 350;
			titleField.x = (stage.fullScreenWidth - 350)/2;
			titleField.y = (stage.fullScreenHeight- titleField.height)/2;
			titleField.selectable = false;
			addChild(titleField);
			
			var timer:Timer = new Timer(2000);
			timer.addEventListener(TimerEvent.TIMER, _onPushMainView);
			timer.start();
		}
		
		private function _createChildren():void
		{
			//setting application width and height
			dispatchEvent(new UpdateAppHeightCommandEvent(UpdateAppHeightCommandEvent.UPDATE_APP_HEIGHT, stage.fullScreenHeight));
			dispatchEvent(new UpdateAppWidthCommandEvent(UpdateAppWidthCommandEvent.UPDATE_APP_WIDTH, stage.fullScreenWidth));
			
			//viewNavigator
			_navigator = new ViewNavigator();
			_navigator.setSize(stage.fullScreenWidth, stage.fullScreenHeight);
			addChild(_navigator);
		}
		
		
		// ------- Event Handlers -------
		private function _onAddedToStage(event:Event):void
		{
			//fire this only once..
			removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			NativeApplication.nativeApplication.addEventListener(Event.EXITING, _onNativeApplication_Exit);
			
			//createContext
			_context = new CellManagerContext(this);

			
			_createChildren();
			_draw();
			
		}
		
		private function _traceTarget(event:MouseEvent):void
		{
			var str:String = "you clicked on "+event.target+" " + event.target.name;
			var cur:DisplayObject = event.target as DisplayObject;
			while(cur.parent)
			{
				cur = cur.parent;
				str+=" < "+cur + " " + cur.name;
			}
			trace(str); 	
		}
		
		private function _onRemovedFromStage(event:Event):void
		{
			//events
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
		}

		private function _onNativeApplication_Exit(event:Event):void
		{
			stage.removeChild(this);
			
			NativeApplication.nativeApplication.removeEventListener(Event.EXITING, _onNativeApplication_Exit);
			_context.shutdown();
			_context = null;
		}
		
		private function _onPushMainView(event:TimerEvent):void
		{
			var noTransition:IViewTransition = new ViewNoneTransition(_navigator);
			_navigator.pushView(MainView, null, null, noTransition);
		}
	}
}

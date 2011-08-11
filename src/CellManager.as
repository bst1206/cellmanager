package
{
	import com.bstack.cellmanager.CellManagerContext;
	
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.Screen;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
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
		
		// ------- Public Methods -------
		
		// ------- Private Properties -------
		private var _context:CellManagerContext;
		
		// ------- Private Methods -------
		private function _draw():void
		{
			graphics.beginFill(0xefefef, 1);
//			graphics.drawRect(
		}
		
		private function _createChildren():void
		{
			
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

			
			_draw();
			
			_createChildren();
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
	}
}

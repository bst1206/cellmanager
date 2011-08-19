package com.bstack.cellmanager.view
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class MainView extends Sprite
	{
		public function MainView()
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
		}
		
		// ------- Private methods -------
		private function _createChildren():void
		{
			
		}
		
		
		// ------- Event Handlers -------
		private function _onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			_createChildren();
		}
				
		
	}
}
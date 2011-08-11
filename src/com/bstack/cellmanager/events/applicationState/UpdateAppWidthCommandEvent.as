package com.bstack.cellmanager.events.applicationState
{
	import flash.events.Event;
	
	public class UpdateAppWidthCommandEvent extends Event
	{
		public static const UPDATE_APP_WIDTH:String = "updateAppWidth";
		
		// ------- Public Properties -------
		private var _appWidth:Number;
		public function get appWidth():Number
		{
			return _appWidth;
		}
		
		// ------- Constructor -------
		public function UpdateAppWidthCommandEvent(type:String, appWidth:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_appWidth = appWidth;
		}
		
		// ------- Event Overrides -------
		override public function clone():Event
		{
			return new UpdateAppWidthCommandEvent(type, _appWidth, bubbles, cancelable);
		}
	}
}
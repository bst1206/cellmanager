package com.bstack.cellmanager.events.applicationState
{
	import flash.events.Event;
	
	public class UpdateAppHeightCommandEvent extends Event
	{
		public static const UPDATE_APP_HEIGHT:String = "updateAppHeight";
		
		// ------- Public Properties -------
		private var _appHeight:Number;
		public function get appHeight():Number
		{
			return _appHeight;
		}
		
		// ------- Constructor -------
		public function UpdateAppHeightCommandEvent(type:String, appHeight:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_appHeight = appHeight;
		}
		
		// ------- Event Overrides -------
		override public function clone():Event
		{
			return new UpdateAppHeightCommandEvent(type, _appHeight, bubbles, cancelable);
		}
	}
}
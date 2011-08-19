package com.bstack.cellmanager.model
{
	import org.robotlegs.mvcs.Actor;
	
	public class ApplicationStateModel extends Actor
	{
		// ------- Constructor -------
		public function ApplicationStateModel()
		{
			super();
		}
		
		// ------- Public Property -------
		private var _appWidth:Number;
		public function get appWidth():Number
		{
			return _appWidth;
		}
		
		private var _appHeight:Number;
		public function get appHeight():Number
		{
			return _appHeight;
		}
		
		// ------- Public Methods -------
		public function setAppWidth(value:Number):void
		{
			_appWidth = value;
			trace("appWidth:",_appWidth);
			//TODO: Dispatch ApplicationStateEvent
		}
		
		public function setAppHeight(value:Number):void
		{
			_appHeight = value;
			trace("appHeight:",_appHeight);
			//TODO: Dispath ApplicationStateEvent
		}
	}
}